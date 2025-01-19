in gemfile 

gem "apartment"
gem 'ros-apartment', require: 'apartment'

now this multitenancy can be used for domain based or subdomain based requrements

after this you can run command or manully add file in config/initializers/apartment.rb
bundle exec rails generate apartment:install

this filw will give initializer... customize this based upon your requirements

Apartment.configure do |config|
  config.excluded_models = %w[Tenant]
  config.use_schemas = false  # Disable schema-based isolation
end



or before that add tenant model with below schema

  create_table "tenants", force: :cascade do |t|
    t.string "name"
    t.string "host"
    t.integer "port"
    t.string "database"
    t.string "adapter"
    t.string "domain"
    t.string "username"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

and make sure that this port value is always 5432 if your tenant db is postgres 

class Tenant < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :domain, presence: true, uniqueness: true
  validates :host, presence: true
  validates :port, presence: true, numericality: { only_integer: true }
  validates :database, presence: true
  validates :adapter, presence: true

  # Dynamic database connection
  def db_configuration
    {
      adapter: adapter,
      host: host,
      port: port,
      database: database,
      username: username,
      password: password
    }.compact
  end

  def switch!
    ActiveRecord::Base.establish_connection(db_configuration)
  end
end



now we are using a custome middleware for the application . you will gem more in gem apartment

app/middleware/domain_tenant_switcher.rb
class DomainTenantSwitcher
  DEFAULT_TENANT_NAME = 'main_app'

  def initialize(app)
    @app = app
  end

  def call(env)
    request = Rack::Request.new(env)
    domain = request.host

    tenant = Tenant.find_by(domain: domain)
    if tenant
      tenant.switch!
    else
      # Default tenant handling
      Apartment::Tenant.switch!(DEFAULT_TENANT_NAME)
    end

    @app.call(env)
  ensure
    Apartment::Tenant.reset
  end
end



in application.rb

require "rails/all"

require "apartment"
require_relative '../app/middleware/domain_tenant_switcher'

    config.middleware.use DomainTenantSwitcher


====================================================================

okay now this is all our main application suppose we do have a post model and controller for testing 
in tennat application we will not pushing this tennat or apartment code

now we are going to test it on localhost

on main application create a main tenant 
called name: "localhost:, domain: "localhost", port: 5432, database: "name_of_db_name_in_developement", username: "postgres", password: "postgres"

now we are copying this basic application without tenant and apartment code just having post model and controller into another directory
change name of db of development in database.yml
and we will run this application on custome server called suppose akshay.com.... nano /etc/hosts
127.0.0.1 akshay.com
127.0.0.1 deeporion.com
127.0.0.1 ajay.com
add domain like this and save file 
now into development.rb
  config.hosts << "akshay.com"


run the server like 

rails s -b 0.0.0.0 -p 3002

now in postman 
akshay.com:3002/posts
create data


================================================================================================

now suppose in main application we are getting this data like add tenant
name: "db_name_of_dev", domain: "akshay.com", host: "localhost", databse: "chnaged_name_od_db_indev", port: 5432, username: "postgres", password: "postgres"

i have added code to get tenant data like 
tenants_controller.rb

class TenantsController < ApplicationController
    before_action :switch_tenant
  
    # GET /tenants/:tenant_name/posts
    def posts
        tenant_name = params[:tenant_name]
        tenant = Tenant.find_by(name: tenant_name)
    
        if tenant
          tenant.switch! # Dynamically connect to the tenant's database
          posts = Post.all
          render json: { message: "Posts for tenant: #{tenant_name}", posts: posts }, status: :ok
        else
          render json: { error: "Tenant not found" }, status: :not_found
        end
      ensure
        # Reset to the default connection
        ActiveRecord::Base.establish_connection(Rails.env.to_sym)
      end
  
    private
  
    # Switch to the tenant's schema
    def switch_tenant
        tenant_name = params[:tenant_name]
        tenant = Tenant.find_by(name: tenant_name)
      
        if tenant
          # Establish connection to the tenant's database
          ActiveRecord::Base.establish_connection(
            adapter: tenant.adapter,
            host: tenant.host,
            port: tenant.port,
            database: tenant.database,
            username: tenant.username,
            password: tenant.password
          )
      
          # Switch to the tenant's schema
          Apartment::Tenant.switch!(tenant.database)
        else
          render json: { error: "Tenant not found" }, status: :not_found
        end
      end
      
  end
  

in routes 
  get '/tenants/:tenant_name/posts', to: 'tenants#posts'
now get this in posman you will get tenant dat on server rails s 
as we ahve main tennat domain as localhost

you will get no of Apartment::Tenant.current, Apartment::Tenant.switch!("database") command s

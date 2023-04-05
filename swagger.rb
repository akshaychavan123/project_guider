For better experience check betterprogramming guide for rswag

rails new project-name --api --database=postgresql
rails g scaffold car name:string model:string
gem 'rspec-rails' # ignore if already set up in project

gem 'rswag'

bundle install
rails g rspec:install # ignore if already set up in project
rails g rswag:install

rails generate rspec:swagger cars

rails generate rspec:swagger API::V1::cars

rake rswag:specs:swaggerize

in swagger.yml at last
    url: http://{defaultHost}
    variables:
      defaultHost:
        default: localhost:3000/
in swagger helper.rb
    servers: [
        {
          url: "http://{defaultHost}",
          variables: {
            defaultHost: {
              default: "localhost:3000/"
            }

in config/initializer/cors.rb uncomment the following code  and the the origin as shown
    Rails.application.config.middleware.insert_before 0, Rack::Cors do
   
        allow do
          origins "*"  
      
          resource "*",
            headers: :any,
            methods: [:get, :post, :put, :patch, :delete, :options, :head]
        end
      end

      check in gemfile is uncommented and require
      gem "rack-cors" , :require => 'rack/cors'

      rails s 
      localhost:3000/api-docs

      For post in cars_spec.rb ====>>>>>
      post('create car') do
        response(200, 'successful') do
          consumes 'application/json'        
  parameter name: :car, in: :body, schema: {          
   type: :object,          
   properties: {            
    name: { type: :string },            
    model: { type: :string }          
   },          
   required: %w[name model]  
  }
          after do |example|
            example.metadata[:response][:content] = {
              'application/json' => {
                example: JSON.parse(response.body, symbolize_names: true)
              }
            }
          end
          run_test!
        end
    end

    check for patch and update
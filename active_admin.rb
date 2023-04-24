gem "activeadmin"
gem "sassc-rails"

gem "devise"

bundle 
 rails g active_admin:install   (use  --skip_users if u dont want devise users)
 rails g devise:install
 rails db:migrate 
 create an AdminUser from console

 go to localhost:3000 and login to admin/login
  to add any resource to the admin dashboard 

  rails g active_admin:resource model_name

  permit parameter from the app/admin/resource to show it on the dashboard

  you will also get one file in config/initializer/active_admin.rb

  you can make changes to admin side from this file you will get 

  add pagination
  authenticate
  logout button
  download links
  filters
  comments
  batch actions
  current_admin_user
  config.site_title = "deeporion"


  to avoid any action in a resource you can do like 

app/admin/resource.rb
actions :all , except: [:destroy]

to change the name of the action at below 
config/locales/en.yml

en:
    active_admin:
        resources:
            post:
                new_model: "make an offer"
                delete_model: "remove post"
                edit_model: "change model"

You can change the name of the resource like 
ActiveAdmin.register Post, as: "Article" do 
    ....logic here ...
    or you can also do like 
        menu label: "Article"
        or specify menu priority on header
        menu priority: 1
end

or you can add namespace to resource also like
ActiveAdmin.register Post, namespace: :today do   
    ... ligic here ....

end


Eager loading
include :author , :categories

You can customize index show and other page and actions ... check docs for active_admin


################################################################################################
================================================================================================
**********************************************************************************************8888

how to add superadmin to the active admin 
add one more gem in previous file

gem 'cancancan'

bundel 

config/initializer/active_admin.rb
config.authorization_adapter = ActiveAdmin::CanCanCanAdapter

config.on_unauthorized_access = :access_denied

add superadmin fields in the admin_users and set type as boolean 
rails g migration add_superadmin_to_admin_users superadmin:boolean
default: false
create app/model/ability.rb
# frozen_string_literal: true

class Ability
    include CanCan::Ability
  
    def initialize(user)
      # Define abilities for the user here. For example:
      #
        return unless user.present?
        can :read, :all
        return unless user.superadmin?
        can :manage, :all
      
      # The first argument to `can` is the action you are giving the user
      # permission to do.
      # If you pass :manage it will apply to every action. Other common actions
      # here are :read, :create, :update and :destroy.
      #
      # The second argument is the resource the user can perform the action on.
      # If you pass :all it will apply to every resource. Otherwise pass a Ruby
      # class of the resource.
      #
      # The third argument is an optional hash of conditions to further filter the
      # objects.
      # For example, here the user can only update published articles.
      #
        # can :update, Article, published: true
      #
      # See the wiki for details:
      # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
    end
  end

  

in the admin/admin_user.rb  ================ You can have your own logic as per need in below file =======
    create one superadmin from the console and login

ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation , :superadmin


  controller do
    # authorize_resource

    def index
      # Only allow superadmin users to access the index page
      if current_admin_user.present?
        super
      else
        redirect_to root_path, alert: "You do not have permission to access this page."
      end
    end
  end
    
  def create
    if current_admin_user.superadmin?
      super
    else
      redirect_to root_path, alert: "You do not have permission to access this page."
    end
  end
    
  def edit
    if current_admin_user.superadmin?
      super
    else
      redirect_to root_path, alert: "You do not have permission to access this page."
    end
  end
    
  def destroy
    if current_admin_user.superadmin?
      super
    else
      redirect_to root_path, alert: "You do not have permission to access this page."
    end
  end

  index do
    selectable_column
    id_column
    column :email
    column :superadmin
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :superadmin
      f.input :password_confirmation
    end
    f.actions
  end


end 
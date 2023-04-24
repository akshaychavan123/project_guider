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
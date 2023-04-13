we are having user login through devise

gemfile 
gem "rolify"

bundle install

rails g rolify Role User

we got role.rb in model

rollify in user.rb 
and migration...


rails db:migrate

you can add any role to user in console like
User.first.add_role :admin

check ==>  User.first.has_role?(:admin) ==> true 
or    User.first.roles 


in application.html.erb to check users role 

    <% if user_signed_in? %>
    Are you admin ? <%= current_user.has_role? (:admin) current_user.roles.pluck(:name) %>
     
    
    <% end %>

    for assigning default role for the user in user.rb
        after_create :assign_default_role

        def assign_default_role
            self.add_role(:new_user) if self.roles.blank?
        end
now we will add the edit option for user forl its roles 
generate code for controller and show pages normal

    in use_params add permit for role like 
        role_ids: []

    in edit.html.erb
        <%= f.label :role %>
        <%= f.collection_check_boxes :role_ids , Role.all , :id , :name %>
apply validation for having roles while we are updating the user


for more information checkout  rollify gem
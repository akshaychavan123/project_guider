
uncomment the trackable option from devise.rb

:trackable 


rails g migration add_trackable_to_devise

in the generated migration ===>>.

def change
    
    add_column :users, :sign_in_count, :integer, default: 0, null: false
    add_column :users, :current_sign_in_at, :datetime
    add_column :users, :last_sign_in_at, :datetime
    add_column :users, :current_sign_in_ip, :string
    add_column :users, :last_sign_in_ip, :string
  
end

rails db:migrate 

rails g controller users index 

show all users data on the index page with above column names i.if sign_in_count and many more 


 in routes ====>>>>
 resources :users
this is for the example of administrate gem 

rails g model author name age    >> author has _many :books
rails g model book name pages edition author:references  >> book belongs_to :author

rails db:migrate
generate some seed data
rails db:seed 


add
gem "administrate" in gemfile 

run the following command to to add existing models in dashboard

rails g administrate:dashboard install 

it will add controller / and dashboard and resources for authr and book by admin namespace 


and if you want to add specific models to the dashboard only then you can run following command 

rails g administrate:dashboard model_name 

and add resources name in routes by admin namespace

#in our model we have 
has_one_attached :image

then the field type for image is 
image_attachment: ActiveStorageField

image_blob: ActiveStorageField
image_url: Field::String

after that create the command to generate the active_storage field

rails g administrate:field active_storage

for more changes use documentation of administrate gem
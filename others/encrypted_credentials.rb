# you can check your credentials in console.rb

Rails.application.credentials

# now we have to set credentials :;
# on terminal run 
EDITOR=vim rails credentials:edit

# at first this will create master.key file delete both master.key and credentials.yml.enc from config folder 
# and run above command once more 


EDITOR=vim rails credentials:edit

# at this time credentials file will open for edit 

# prese shift + i to edit .... have set your credentials ...

aws:
access_key_id: 1234567
secret_access_key: 7888888

# after that press esc 
# press : wq 
# this will save and exit from credentials 

# now we can go to rails c to check  credentials like below...
Rails.application.credentials.aws
Rails.application.credentials.aws[:access_key_id]
Rails.application.credentials.aws[:secret_access_key]


# you can see this creentials in views like

<%= Rails.application.credentials.github[:id] %>

you can also set credentials for developement and production various like

production : 
    aws:
        access_key_id: 1234567
        secret_access_key: 7888888

developement: 
    aws:
        access_key_id: 1234567
        secret_access_key: 7888888

now if you push all project to the github your credentials will not be sent 


==============================================================================================================================

Another way to add credentials

create .env file into your application

add  into gemfile
gem 'dotenv-rails', groups: [:development, :test] 

set credentials like

into your .env file 
github_id = 1234
github_secret = 234567vhbjmn,km b5678u

access in console like 
ENV['github_id'] ====>>>> use in application also 
ENV['github_secreat']

add below line in application.rb
above modile and below bundler 

Dotenv::Railtie.load


add .env file into .gitignore so that it will not moved to repository


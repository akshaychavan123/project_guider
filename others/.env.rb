so am saving data in .env files like below
but rfor using env you have to use gem for that

gem "dotenv-rails"

create a .env file and save data be like 

TEMPLATEAPP_DATABASE=test
TEMPLATEAPP_DATABASE_DEV=dev
TEMPLATEAPP_DATABASE_USER=postgres
TEMPLATEAPP_DATABASE_PASSWORD=PASSWORD
TEMPLATE_DATABASE_HOSTNAME=localhost
UNIFONIC_API_KEY=xYMmWva1sHImWYh7infHhpwSRcUIvr
SENDER_PHONE=EjariSMS

above data is like in "" but in here we store like this 
and when you are using this data 

use like 


in initializer
 config.api_key = ENV['UNIFONIC_API_KEY']
    config.sender_phone = ENV['UNIFONIC_SENDER_ID']



    in database.yml
     database: <%= ENV['TEMPLATEAPP_DATABASE'] %>
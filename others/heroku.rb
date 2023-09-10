heroku login 
if this command gives ip address issue  the use below

    heroku login -i
    email: 
    pssword :   use password as API key which is availble in setting on heroku application



heroku apps:create appname     or
heroku create appname

git push heroku main


if you ar working on any branch then while pushing code to heroku 
    git push heroku branchname:main

    if there is any problem for stack set then do 
        heroku stack:set heroku-20 ................. replace 20 with the desired stach version


        after pushing code to heroku dont forget to migrate like below

        heroku run rake db:migrate
        for other requirements you can use below 
        heroku run rake db:seed
        heroku run rake db:rollback
        heroku run rake db:reset 

        if above reset command is not working then use

heroku pg:reset DATABASE_URL --confirm appname

if you are facing any errors in ur application then you can check logs on terminal like

heroku logs --tail

git remote -v +++>> to check heroku remote

to remove remote heroku use

git remote remove heroku

to add another or any heroku git remote use 

heroku git:remote -a appname


for the first time you have to addon database for heroku use below

    heroku addons:create heroku-postgresql

    reset database

migration
    heroku run rails db:migrate --app your-app-name
    11:00
    heroku restart --app your-app-name
# reset
    heroku pg:reset DATABASE_URL -a jaipur


    am not able to reset or drop database . giving me an error of another user_session running these database
    solution
    ps aux | grep postgres
    If you find any relevant processes, you can kill them using:
    kill <process_id>
    OR Run below command
    spring stop (edited) 

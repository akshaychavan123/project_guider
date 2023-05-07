rails g scaffold games start_at:datetime end_at:datetime title:string description:text address:text

create some records from the seed file 

bundle add icalendar or 
gem "icalendar"

for more deatils go to ===>>.
    gem icalendar github page or go to superails by yaroslav shamrov

 now go to the game.rb i.e model 
 copied from github of gem i calendar ====>>> just make some changes 
 class Game < ApplicationRecord
    require 'icalendar'
    def to_icalender
        cal = Icalendar::Calendar.new
        cal.event do |e|
        e.dtstart     = start_at
        e.dtend       = end_at
        e.summary     = title
        e.description = description
        e.ip_class    = "PRIVATE"
        e.location = address
        end
        cal.publish
        cal.to_ical  ==>>>> this will show all data on the index page or show page  
    end
end

on the index.html.erb or may be on the show page 

<%= game.to_icalendar %> 

Now will move to download as ics format ===>>.
to the show action ===>>>

<%= game.to_icalendar %> 
<%= link_to "add_to_calender" , game_path(game , format: :ics)  %>

now to the show action 
respond_to do |format| 
    format.html
    format.ics do
      render plain: @game.to_icalendar
    end
  end 
    # yey! ..... You are done now go for furhther betterment ====>>>> 

    # add following to the to_icalendar method in model
    e.sequence = Time.now.to_i
    e.uid = id 
    # to add url to the event add following line
    e.url = " url addresss "  ==>>
    # to use our own url i.e game_path do on top in model
    include Rails.application.routes.url_helpers 
   and e.url = game_url(self) 
#    and in config/developement.rb ===>>>. on top
Rails.application.routes.default_url_options[:host] = 'localhost:3000'

# and instead of this ===>> in show action ==>.render plain: @game.to_icalendar
# do like this ===>>    send_data @game.to_icalendar , filename: @game.title

# so this is all we can do do with this gem now just create app/service/games/icalender_event.rb file 
# and move all code from model to this file 










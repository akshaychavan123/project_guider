


gem "pagy"

bundle install


in ===>>.ApplicationController/AnyController
include Pagy::Backend

in ===>>.ApplicationHelper/AnyHelper
include Pagy::Frontend



to controller actionsss like to index ===>>>
@pagy, @records = pagy(Product.some_scope)

it will be like 
def index
    @pagy,@dishes = pagy(Dish.all)
end



in the dishes index.html.erb where you want this buttons ===>>>
    <%== pagy_nav(@pagy) %>

    By default you will have 20 records per page if you want to change the record per page 

    @pagy,@dishes = pagy(Dish.all , items: 10)

    to go further more with pagy apppreances go to pagy  gem documentation 
    superails by Yaroslav Shamrov yt channel


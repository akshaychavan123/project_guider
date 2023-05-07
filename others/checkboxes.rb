


rails g migration add_tags_to_dishes tags:text

to the generated migration===>

# add_column :dishes, :tags, :text , array: true , default: []
the migration should be like this but its not workin so go with like below
class AddTagsToDishes < ActiveRecord::Migration[7.0]
    def change
      add_column :dishes, :tags, :text , array: true 
    end
  end


  <% Dish::TAGS.each do |key| %>
    <%= form.check_box :tags , {multiple: true} , key , nil %>
    <%= form.label key %>
   
    <% end %>
   

    to make it edit with previouus checkboxes do it like 


        <% Dish::TAGS.each do |key| %>
            <%= form.check_box :tags , {multiple: true , checked: form.object.tags&.include?(key.to_s)} , key , nil %>
            <%= form.label key %>
           
            <% end %>


            on the index page ==>>>

            on th econtroller in params
            params.require(:dish).permit(:menu , :price , :restaurant_id  , tags: [] )


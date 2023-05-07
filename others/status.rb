Changing status by  button 

rails g migration add_status_to_restaurant status 

in the generatedmigration==>>

add_column :restaurants, :status, :string , null: false , default: "open"

rails db:migrate

in restaurant Model ===>>>>
STATUSES = [:open , :close , :unknown]

in routes.rb ===>>.
resources :restaurants do
    member do
      patch :update_status
    end
  end

  on the controlller ==>>>>
  def update_status
    @restaurant.update(status: params[:status])
    redirect_to @restaurant , notice: "status changed to #{@restaurant.status}."
  end


in the index page===>>
<td><%= restaurant.status %></td>

in the show page ===>>>>>>
<p> <strong> Restaurant Status :</strong> 
<%= @restaurant.status %>  
 <% Restaurant::STATUSES.each do |status| %> 
    <%  if !@restaurant.status.eql?(status.to_s) %>
    <%= button_to status  , update_status_restaurant_path(@restaurant , status: status) , method: :patch %>
    <% end %>
 <% end %>
 </p>
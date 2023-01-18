# on the controller 
  def import
    @posts = Post.where("title LIKE ?",
      Post.sanitize_sql_like(params[:title]) + "%")
  end 


#   in routes 
resources :posts do
    collection do
        get :import
    end 
end

# in import.html.erb
<%= form_with url: import_posts_path, method: :get do |form| %>
    <%= form.label :title, "Search for:" %>
    <%= form.text_field :title %>
    <%= form.submit "Search" %>
  <% end %>
  
  <% @posts.each do |post| %>
  <%= post.title %>
  <%= post.body %>
  <% end %>

dont need to create import.html.erb just place above form in 
index page and on the controller to the import action
just render :index
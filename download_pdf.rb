gemfile 

gem 'wicked_pdf'
gem 'wkhtmltopdf-binary'


controller 
add below method for member action
def download_pdf
    respond_to do |format|
      format.pdf do
        render pdf: 'user_profile', template: 'user/show.pdf.erb'
      end
    end
end

routes

resources :users do
    member do
      get 'download_pdf'
    end
  end


  view pages

  user/show.pdf.erb


  <!DOCTYPE html>
<html>
<head>
  <title>User Profile</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f5f5f5;
    }
    h1 {
      color: #333;
      border-bottom: 2px solid #333;
      padding-bottom: 10px;
    }
    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
    }
    th, td {
      padding: 10px;
      border: 1px solid #ccc;
    }
    th {
      background-color: #f0f0f0;
      text-align: left;
    }
    td {
      background-color: #fff;
    }
  </style>
</head>
<body>
  <h1>User Profile</h1>
  <table class="table">
    <tr>
      <th>Name</th>
      <td><%= @user.name %></td>
    </tr>
    <tr>
      <th>Gender</th>
      <td><%= @user.gender %></td>
    </tr>
    <tr>
      <th>Email</th>
      <td><%= @user.email %></td>
    </tr>
    <tr>
      <th>State</th>
      <td><%= @user.state %></td>
    </tr>
    <tr>
      <th>Pincode</th>
      <td><%= @user.pincode %></td>
    </tr>
    <tr>
      <th>Address</th>
      <td><%= @user.address %></td>
    </tr>
  </table>
</body>
</html>




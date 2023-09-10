# in gemfile ===>>>>

TWO IMPORTANT THINGS TO BE NOTE
USER @USER.PRESENT? INSTED OF @USER.PERSISTED 
AND USE IN APPLICTION CONTROLLER SHOULD BE INHERITED FROM BASE THAN API


gem "devise"
gem 'omniauth-github', github: 'omniauth/omniauth-github', branch: 'master'
gem "omniauth-rails_csrf_protection"
gem 'omniauth-google-oauth2'

# in the  controller/users/omniauth_callbacks_controller.rb ===>>>>>
# Two Different type of methods for github and google authentication ....


class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def github
      @user = User.from_omniauth(request.env['omniauth.auth'])
      if @user.present?
          flash[:notice] =  t'devise.omniauth_callbacks.success' , kind: "Github"
          sign_in_and_redirect @user , method: :post ,event: :authentication
      else
          session['devise.github_data']=request.env['omniauth.auth'].except('extra')
          redirect_to new_user_registration_url 
      end
    end
    # def google_oauth2
    #   @user = User.from_omniauth(request.env['omniauth.auth'])
    #   if @user.persisted?
    #       flash[:notice] = t'devise.omniauth_callbacks.success' , kind: "google_oauth2"
    #       sign_in_and_redirect @user , method: :post ,event: :authentication
    #   else
    #       session['devise.auth_data']=request.env['omniauth.auth'].except('extra')
    #       redirect_to new_user_registration_url , method: :post , alert: :@user.errors.full_messages.join("\n")
    #   end
    # end
  
    def google_oauth2
      callback
    end
  
    def github
      callback
    end
  
    def callback
      auth  = request.env["omniauth.auth"]
      @user = User.from_omniauth(auth)
      if @user && @user.persisted?
        sign_in_and_redirect @user
      else
        redirect_to root_path
      end
    end
  
  end
  



#   in model /user.rb ====>>>>>>>

class User < ApplicationRecord

    devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable , :omniauthable , omniauth_providers: [  :google_oauth2 , :github]
  
    # 1))))))====>>>> way ===>>>>> 
    def self.from_omniauth(access_token)
      data = access_token.info
      user = User.where(email: data['email']).first
      unless 
        user= User.create(email: data['email'], password: Devise.friendly_token[0,20])
      end
      user.name = access_token.info.name
      user.image = access_token.info.image
      user.uid = access_token.uid
      user.provider = access_token.provider
      user.save
      user 
      
      
    end
    # 2))))))))====>>>>>>> way ====>>.
    def self.from_omniauth(auth)
      user = User.where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.name  = auth.info.name
      end
      if user
        user.email = auth.info.email
        user.name  = auth.info.name
        user.save
      end
      user
    end
  
  end
  



#   in config/initializers/omniauth.rb =====>>>>>>>>
Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET']
  end
  OmniAuth.config.allowed_request_methods = %i[get]



#   in routes.rb ======>>>>>>>>
devise_for :users , controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations'   
  }


#   in config/initializers/devise.rb ===>>>>>>
#   line no 274 and 275

config.omniauth :github, 'APP_ID', 'APP_SECRET', scope: 'user,public_repo'
  config.omniauth :github, 'd4f83ba9183897b45ede', '5e1488c6a059f45140b0552fecdc8abcf88a62c2'
  config.omniauth :google_oauth2, '968223638131-n06nldjq1mdhlrmasvatqmg1hpt118qm.apps.googleusercontent.com', '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'


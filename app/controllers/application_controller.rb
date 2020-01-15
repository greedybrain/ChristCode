require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :sessions_secret, 'john_3_16'
  end

  get "/" do
    erb :'index.html'
  end

  helpers do 

    def current_user
      User.find_by(username: session[:username])
    end

    def logged_in?
      !!session[:username]
    end 

    # def user_signup
     
    # end

    # def signup_form_or_user_home
      
    # end

    # def login_form_or_user_home
     
    # end

    # def user_login
      
    # end

    # def user_logout
    # end

  end 

end

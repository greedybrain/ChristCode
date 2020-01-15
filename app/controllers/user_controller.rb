class UserController < ApplicationController

    get '/users/home' do 
        if logged_in?
            erb :"/users/home.html"
        else
            redirect '/login'
        end
    end
    
    get '/signup' do 
        if logged_in?
            redirect '/users/home'
        else
            erb :'/users/new.html'
        end
    end 

    post '/signup' do 
        @user = User.new(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
        if @user.save
            session[:username] = @user.username
            redirect "/users/home"
        else 
            erb :"/users/new.html"
        end
    end 

    get '/login' do 
        if logged_in?
            redirect "/users/home"
        else 
            erb :"/users/login.html"
        end
    end

    post '/login' do 
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:username] = @user.username
            redirect "/users/home"
        else
            erb :"/users/login.html"
        end
    end

    get '/logout' do 
        session.clear
        redirect '/login'
    end
end 
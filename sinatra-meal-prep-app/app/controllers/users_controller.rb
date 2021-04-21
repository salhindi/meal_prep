class UsersController < ApplicationController

    get '/login' do
        erb :'registrations/login'
    end

    post '/login' do
        @user = User.find_by(email: params[:email])

        if @user && @user.authenticate(password: params[:password])
            session[:user_id] = @user.id
        else
            redirect "/users/#{@user.id}"
        end
    end

    get '/signup' do
        erb :'registrations/signup'
    end

    post "/users" do
        if params[:name] != "" && params[:email] != "" && params[:password] != ""
            @user = User.create(params)
           session[:user_id] = @user.id 
            redirect "/users/#{@user.id}"
        else
           #invalid
           redirect '/signup'
        end
    end

    get '/users/:id' do 
        @user = User.find_by(id: params[:id])
        erb :'meals/show_meals'
    end

    get '/logout' do
        session.clear
        redirect '/'
    end

end
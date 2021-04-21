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

    get '/users/:id' do 
        erb :'meals/show_meals'
    end

end
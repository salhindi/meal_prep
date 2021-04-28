class UsersController < ApplicationController

    get '/login' do
        erb :'registrations/login'
    end

    post '/login' do
        @user = User.find_by(email: params[:email])

        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect "/users/#{@user.id}"
        else
            flash[:error]="Invalid credentials. Try again."
            redirect '/login'
        end
    end

    get '/signup' do
        erb :'registrations/signup'
    end

    get '/users' do 
        current_user
        erb :index
    end

    post "/users" do
        @user = User.new(params)
        if @user.save
           session[:user_id] = @user.id 
            redirect "/users/#{@user.id}"
        else
            flash[:error] = "You're missing something! #{@user.errors.full_messages.to_sentence}."
           redirect '/signup'
        end
    end

    get '/users/:id' do 
        @user = User.find_by(id: params[:id])
        erb :'users/show'
    end

    get '/logout' do
        session.clear
        redirect '/'
    end

end
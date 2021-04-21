require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "our_meal_app"
  end

  get "/" do
    if logged_in?
      redirect to "/user/#{current_user.id}"
    else
    erb :welcome
  end

      helpers do 

        def current_user
          @current_user ||= User.find_by(id: session[:user_id])
        end

        def logged_in?
          !!current_user
        end

      end
end

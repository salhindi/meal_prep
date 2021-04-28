
require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV.fetch('SESSION_SECRET') { SecureRandom.hex(64) }
    register Sinatra::Flash
  end

  get "/" do
    if logged_in?
      erb :'users/index'
    else
      erb :welcome
    end
  end

  helpers do 

      def current_user
        @current_user ||= User.find_by(id: session[:user_id])
      end

      def logged_in?
        current_user != nil
      end

      def authorized_to_edit?(meal) 
          @meal.user == current_user
      end
    end
end

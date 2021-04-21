class UsersController < ApplicationController

    get '/login' do
        erb :'registrations/login'
    end

    get '/signup' do
        erb :'registrations/signup'
    end
end
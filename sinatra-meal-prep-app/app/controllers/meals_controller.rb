class MealsController < ApplicationController

    get '/meals/new' do
        erb :'/meals/new_meal'
    end

    post '/meals' do
        erb '/show_meals'
    end

end
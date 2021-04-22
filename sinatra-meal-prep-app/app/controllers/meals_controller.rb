class MealsController < ApplicationController

    get '/meals' do
        @meals = Meal.all
        erb :'meals/index'
    end

    get '/meals/new' do
        erb :'/meals/new_meal'
    end

    post '/meals' do
        if !logged_in? 
            redirect "/"
        end
            if params[:name] != "" && params[:ingredients] != "" && params[:meal_time] != ""
                @meal = Meal.create(name: params[:name], ingredients: params[:ingredients], meal_time: params[:meal_time], user_id: current_user.id)
                redirect "/meals/#{@meal.id}"
            else
                redirect '/meals/new'
            end
        
    end

    get '/meals/:id' do 
        @meal = Meal.find(params[:id])
        erb :'/meals/show_meals'
    end

    get '/meals/:id/edit' do 
        @meal = Meal.find(params[:id])
        erb :"meals/edit"
    end


end
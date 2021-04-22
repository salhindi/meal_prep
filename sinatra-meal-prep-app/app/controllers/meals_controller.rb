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
        set_meal
        erb :'/meals/show_meals'
    end

    get '/meals/:id/edit' do 
        set_meal
        if logged_in?
            if authorized_to_edit?(@meal)
                erb :"/meals/edit"
            else
                redirect "/users/#{current_user.id}"
            end
        else
            redirect '/'
        end
    end

    patch '/meals/:id' do 
        set_meal
        if logged_in?
            if authorized_to_edit?(@meal)
                @meal.update(name: params[:name], ingredients: params[:ingredients], meal_time: params[:meal_time], photo: params[:photo])
                redirect "/meals/#{@meal.id}"
            else
                redirect "/users/#{current_user.id}"
            end
        else
            redirect '/'
        end
    end

    private
    def set_meal
        @meal = Meal.find(params[:id])
    end 
end
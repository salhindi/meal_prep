class MealsController < ApplicationController

    get '/meals' do
        @meals = Meal.all
        # @meals = Meal.where(user_id: 1)
        erb :'meals/index'
    end

    get '/meals/new' do
        erb :'/meals/new_meal'
    end

    post '/meals' do
        if !logged_in? 
            redirect "/"
            flash[:message]="Please login or signup."
            end
        if params[:name] != "" && params[:ingredients] != "" && params[:meal_time] != ""
            flash[:message] = "New meal created."
            @meal = Meal.create(name: params[:name], ingredients: params[:ingredients], meal_time: params[:meal_time], user_id: current_user.id)
            redirect "/meals/#{@meal.id}"
        else
            flash[:error] = "Fill in all fields."
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
                flash[:error] = "That's not your meal, silly."
                redirect "/users/#{current_user.id}"
            end
        else
            flash[:error]="Login or Signup before creating a meal."
            redirect '/'
        end
    end

    patch '/meals/:id' do 
        set_meal
        if logged_in?
            if authorized_to_edit?(@meal) && params[:name] != "" && params[:ingredients] != "" && params[:meal_time]
                @meal.update(name: params[:name], ingredients: params[:ingredients], meal_time: params[:meal_time], photo: params[:photo])
                flash[:message]="Meal updated."
                redirect "/meals/#{@meal.id}"
            else
                flash[:error]="Failed: It's not your meal or a field was left empty."
                redirect "/users/#{current_user.id}"
            end
        end
    end

    delete '/meals/:id' do 
        set_meal
        if authorized_to_edit?(@meal)
            @meal.destroy
            flash[:message]="Meal successfully removed."
            redirect "/users/#{current_user.id}"
        else
            @flash[:error] = "That's not yours to remove."
            redirect "/meals"
        end
    end

    private
    def set_meal
        @meal = Meal.find(params[:id])
    end 
end
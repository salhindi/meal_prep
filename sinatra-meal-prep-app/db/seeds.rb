sara = User.create(name: "Sara", email: "sara@example.com", password: "password")
jaren = User.create(name: "Jaren", email: "jaren@example.com", password: "password")


Meal.create(name: "Pasta", ingredients: "spaghetti, tomato sauce, parmesan cheese, meatballs", meal_time: "Sunday", photo: "https://images.unsplash.com/photo-1598866594230-a7c12756260f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=911&q=80", user_id: sara.id)

Meal.create(name: "Pasta", ingredients: "spaghetti, tomato sauce, parmesan cheese, meatballs", meal_time: "Sunday", photo: "https://images.unsplash.com/photo-1598866594230-a7c12756260f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=911&q=80", user_id: jaren.id)

sara.meals.create(name: "salad", ingredients: "lettuce", meal_time: "Lunch", photo: "https://images.unsplash.com/photo-1600335895229-6e75511892c8?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1868&q=80")

jarens_meal = jaren.meals.build(name: "salad", ingredients: "lettuce", meal_time: "Lunch", photo: "https://images.unsplash.com/photo-1600335895229-6e75511892c8?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1868&q=80")
jarens_meal.save
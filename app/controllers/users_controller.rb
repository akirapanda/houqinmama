class UsersController < ApplicationController
   layout 'user'
   def show
     @user = current_user
   end
   
   def index 
   end
     
   def shopping
     @shoppings=Shopping.where(:user_id=>current_user.id).order("created_at desc")
   end
   
   def history_buy
     @shoppings = Shopping.where(:user_id => current_user.id).order("created_at desc")
   end
   
end

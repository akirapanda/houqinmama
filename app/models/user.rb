class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
         
   def admin?
     if email=="p.chenliang@gmail.com" || email=="525483886@qq.com" || email== "xoyljlj@126.com" ||
        email=="670390177@qq.com" || email=="630131222@qq.com"
       return true
     end
   end
end

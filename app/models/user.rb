class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  ROLES = ["user",'admin']
         
   def admin?
     if email=="p.chenliang@gmail.com" || role == 'admin'
       return true
     end
   end
end

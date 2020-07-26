class UserMailer < ApplicationMailer

 def user_confirmation(user)
   @user = user
   mail(:from => "myemailid@gmail.com", :to => @user.email, :subject => "Thank you for registration")
 end
end

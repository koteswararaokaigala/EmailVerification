class UsersController < ApplicationController
	def index
	end

	def create
	@user = User.create(:first_name=> params[:user][:first_name],:last_name=> params[:user][:last_name],:email=> params[:user][:email],:city=> params[:user][:city])
     if @user
           UserMailer.user_confirmation(@user).deliver_now
	        render :new

	 else
           flash[:notice] = "something went wrong!"
	 end
	end
	def edit
		@user =  User.find(params[:id])
		if @user.email_confirmed == false && @user.confirm_token.nil?
	           @user.update_attributes(:email_confirmed => true,:confirm_token => SecureRandom.urlsafe_base64.to_s)
                render :edit
		else
                 flash[:notice] = "Email has been verified already,So Please Login"
                 render :login
		end
	end
	
	def update_password 
          @user =  User.find(params[:id])
	    if @user
       		   status =    @user.update_attributes(:password_digest=> params[:user][:password_digest])
		   if status
			   render :login 
		   end
	    end
	end
	def login
		 @user = User.find(params[:id])
		 if @user.password_digest == params[:password]
			 render :signin
		 else
			 flash[:notice] = "Email Or Password is Not maching"
		 end
	end


end

class SessionsController < ApplicationController
    def new
    end
    
    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            puts user.employee.role
            login(user)
            #Here we check authentication
            #Then redirect to the respective pages
            redirect_to home_url
        else
            flash.now[:danger] = "Invalid Email or Password"
            render 'new'
        end
    end
    
    def destroy
        logout
        redirect_to home_url
    end
end

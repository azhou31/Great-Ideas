class SessionsController < ApplicationController
    def create
        user = User.find_by(email: params[:email])        
        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect_to "/ideas"
        else
          flash[:errors] = 'Invalid email/password combination'
          redirect_to :back
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_path
    end
end

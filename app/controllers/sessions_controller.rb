class SessionsController < ApplicationController
    before_action :logged_in, only: [:destroy]
    
    def new 
       @businesses = Business.all
    end

    def create 
        @business = Business.find_by(email: params[:email])  
        if @business.authenticate(params[:password])
            session[:business_id] = @business.id
            redirect_to business_path(@business)
        else
            redirect_to signin_path
        end
    end

    def googleAuth
        @business = Business.find_or_create_by(email: auth['info']['email'])
         if @business.id == nil 
            render 'businesses/edit' 
         else
            session[:business_id] = @business.id
            redirect_to business_path(@business)
         end
    end

    def destroy 
            session.destroy
            redirect_to signin_path
    end
      
    private
    def auth
        request.env['omniauth.auth']
    end

end
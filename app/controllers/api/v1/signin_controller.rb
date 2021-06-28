module Api 
    module V1
        class SigninController < ApplicationController
            protect_from_forgery with: :null_session
            
            def create 
                signin = Signin.new(signin_params)
                email = signin[:email]
                password = signin[:password]
                values = Signin.find_by(email: email)
                if Signin.where(email: email).and(Signin.where(password: password)).empty? 
                    render json: {status: 'ERROR', message: 'Log In credentails are invalid.', data: signin.errors}                   
                else
                    render json: {status: 'SUCCESS', message: 'Successfully Logged In.', data: values}, status: :ok
                end
            end

            private 

            def signin_params
                params[:signinDetails].permit(:email, :password)
            end
        end
    end
end 
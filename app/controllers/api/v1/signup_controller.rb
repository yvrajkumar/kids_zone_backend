module Api 
    module V1
        class SignupController < ApplicationController
            protect_from_forgery with: :null_session
            
            def create 
                signup = Signup.new(signup_params)
                email = signup[:email]
                if Signup.where(email: email).empty? 
                    if signup.save
                        render json: {status: 'SUCCESS', message: 'Account Created', data: signup}, status: :ok
                    else
                        render json: {status: 'ERROR', message: 'Account Not Created', data: signup.errors}
                    end
                else
                    render json: {status: 'ERROR', message: 'Account alrerady exist with this email.', data: signup.errors}
                end
            end

            private 

            def signup_params
                params[:signupDetails].permit(:name, :email, :password, :phone, :address)
            end
        end
    end
end 
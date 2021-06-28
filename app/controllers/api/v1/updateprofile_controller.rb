module Api 
    module V1
        class UpdateprofileController < ApplicationController
            protect_from_forgery with: :null_session
            
            def create 
                email = updateprofile_params[:email]
                user = Updateprofile.find_by(email: email)
                if user.update(updateprofile_params)   
                    values = Updateprofile.where(email: email)
                    puts values              
                    render json: {status: 'SUCCESS', message: 'Profile is updated.', data: values}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'Profile is not updated.', data: values}
                end
            end

            private 

            def updateprofile_params
                params[:profileDetails].permit(:name, :email, :password, :phone, :address)
            end
        end
    end
end 
module Api 
    module V1
        class DeleteprofileController < ApplicationController
            protect_from_forgery with: :null_session
            
            def create 
                email = deleteprofile_params[:email]
                user = Deleteprofile.find_by(email: email)
                values = "Success"
                if user.destroy                
                    render json: {status: 'SUCCESS', message: 'Profile is deleted.', data: values}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'Plofile is not deleted.', data: values}
                end
            end

            private 

            def deleteprofile_params
                params[:profileDetails].permit(:email)
            end
        end
    end
end 
module Api 
    module V1
        class AdditemController < ApplicationController
            protect_from_forgery with: :null_session
            
            def create 
                additem = Additem.new(additem_params)

                if additem.save
                    render json: {status: 'SUCCESS', message: 'Item added to cart.', data: additem}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'Item not added to cart.', data: additem.errors}
                end

            end

            private 

            def additem_params
                params[:cart].permit(:email, :product_id, :status, :quantity, :cost)
            end
        end
    end
end 
module Api 
    module V1
        class RemovefromcartController < ApplicationController
            protect_from_forgery with: :null_session
            
            def create 
                order_id = removefromcart_params[:order_id]
                order = Removefromcart.find_by(order_id: order_id)
                values = "Success"
                if order.destroy                
                    render json: {status: 'SUCCESS', message: 'Order is removed.', data: values}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'Order is not removed.', data: values}
                end
            end

            private 

            def removefromcart_params
                params[:removefromcart].permit(:order_id)
            end
        end
    end
end 
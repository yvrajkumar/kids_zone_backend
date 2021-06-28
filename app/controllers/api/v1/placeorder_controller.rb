module Api 
    module V1
        class PlaceorderController < ApplicationController
            protect_from_forgery with: :null_session
            
            def create 
                order_id = placeorder_params[:order_id]
                order = Placeorder.find_by(order_id: order_id)
                values = "Success"
                if order.update(status: "Order")                 
                    render json: {status: 'SUCCESS', message: 'Order is placed.', data: values}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'Order is not placed.', data: values}
                end
            end

            private 

            def placeorder_params
                params[:placeorder].permit(:order_id)
            end
        end
    end
end 
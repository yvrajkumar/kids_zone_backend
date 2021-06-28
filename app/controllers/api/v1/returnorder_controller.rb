module Api 
    module V1
        class ReturnorderController < ApplicationController
            protect_from_forgery with: :null_session
            
            def create 
                order_id = returnorder_params[:order_id]
                order = Returnorder.find_by(order_id: order_id)
                puts order
                values = "Success"
                if order.update(status: "Return")                 
                    render json: {status: 'SUCCESS', message: 'Order is requested for return.', data: values}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'Order is not returned.', data: values}
                end
            end

            private 

            def returnorder_params
                params[:returnorder].permit(:order_id)
            end
        end
    end
end 
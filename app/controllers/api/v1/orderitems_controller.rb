module Api 
    module V1
        class OrderitemsController < ApplicationController
            protect_from_forgery with: :null_session
            
            def create 
                orderitems = Orderitems.new(orderitems_params)
                email = orderitems[:email]
                values = Orderitems.where(email: email).and(Orderitems.where.not(status: "Cart"))
                if Orderitems.where(email: email).and(Orderitems.where.not(status: "Cart")).empty? 
                    render json: {status: 'ERROR', message: 'No items in the cart.', data: values}                   
                else
                    render json: {status: 'SUCCESS', message: 'Cart items are found.', data: values}, status: :ok
                end
            end

            private 

            def orderitems_params
                params[:userDetails].permit(:email)
            end
        end
    end
end 
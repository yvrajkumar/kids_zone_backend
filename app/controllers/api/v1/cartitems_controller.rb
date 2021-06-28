module Api 
    module V1
        class CartitemsController < ApplicationController
            protect_from_forgery with: :null_session
            
            def create 
                cartitems = Cartitems.new(cartitems_params)
                email = cartitems[:email]
                values = Cartitems.where(email: email).and(Cartitems.where(status: "Cart"))
                if Cartitems.where(email: email).and(Cartitems.where(status: "Cart")).empty? 
                    render json: {status: 'ERROR', message: 'No items in the cart.', data: values}                   
                else
                    render json: {status: 'SUCCESS', message: 'Cart items are found.', data: values}, status: :ok
                end
            end

            private 

            def cartitems_params
                params[:userDetails].permit(:email)
            end
        end
    end
end 
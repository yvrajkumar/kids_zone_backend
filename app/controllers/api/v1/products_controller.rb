module Api 
    module V1
        class ProductsController < ProductsController
            protect_from_forgery with: :null_session
            
            def create 
                # products = Products.new(products_params)
                choice = products_params[:type]
                puts choice
                if choice=="brands"
                    values = Products.where.not(brand: [nil, ""])
                else 
                    values = Products.where(gender: choice).or(Products.where(brand: choice)).or(Products.where(category: choice))
                end
                if Products.where(gender: choice).or(Products.where(brand: choice))                    
                    render json: {status: 'SUCCESS', message: 'Products are found.', data: values}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'Products not found.', data: products.errors}
                end
            end

            private 

            def products_params
                params[:categoryType].permit(:type)
            end
        end
    end
end 
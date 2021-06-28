module Api 
    module V1
        class SortdescController < ApplicationController
            protect_from_forgery with: :null_session
            
            def create 
                # sortdesc = sortdesc.new(sortdesc_params)
                choice = sortdesc_params[:type]
                category = sortdesc_params[:category]
                puts category
                puts choice
                if category==="price"
                    values = Sortdesc.order("price DESC")
                else 
                    values = Sortdesc.order("product_size DESC")
                end
                if choice=="brands"
                    values = values.where.not(brand: [nil, ""])
                else 
                    values = values.where(gender: choice).or(values.where(brand: choice)).or(values.where(category: choice))
                end
                if Sortdesc.where(gender: choice).or(Sortdesc.where(brand: choice))                    
                    render json: {status: 'SUCCESS', message: 'Sorted Successfully.', data: values}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'Not sorted.', data: sortdesc.errors}
                end
            end

            private 

            def sortdesc_params
                params[:sortby].permit(:category, :type)
            end
        end
    end
end 
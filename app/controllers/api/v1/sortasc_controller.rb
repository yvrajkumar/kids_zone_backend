module Api 
    module V1
        class SortascController < ApplicationController
            protect_from_forgery with: :null_session
            
            def create 
                # sortasc = sortasc.new(sortasc_params)
                choice = sortasc_params[:type]
                category = sortasc_params[:category]
                puts category
                puts choice
                if choice=="brands"
                    values = Sortasc.where.not(brand: [nil, ""]).order(category)
                else 
                    values = Sortasc.order(category)
                    values = values.where(gender: choice).or(values.where(brand: choice)).or(values.where(category: choice))
                end
                if Sortasc.where(gender: choice).or(Sortasc.where(brand: choice))                    
                    render json: {status: 'SUCCESS', message: 'Sorted Successfully.', data: values}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'Not sorted.', data: sortasc.errors}
                end
            end

            private 

            def sortasc_params
                params[:sortby].permit(:category, :type)
            end
        end
    end
end 
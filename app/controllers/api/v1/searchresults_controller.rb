module Api 
    module V1
        class SearchresultsController < ApplicationController
            protect_from_forgery with: :null_session
            
            def create 
                values = Searchresults.where("lower(gender) LIKE lower(?) ", "%#{searchresults_params[:type]}%").or(Searchresults.where("lower(product_name) LIKE lower(?) ", "%#{searchresults_params[:type]}%")).or(Searchresults.where("lower(brand) LIKE lower(?) ", "%#{searchresults_params[:type]}%")).or(Searchresults.where("lower(category) LIKE lower(?) ", "%#{searchresults_params[:type]}%"))
                if Searchresults.where("lower(gender) LIKE lower(?) ", "%#{searchresults_params[:type]}%").or(Searchresults.where("lower(product_name) LIKE lower(?) ", "%#{searchresults_params[:type]}%")).or(Searchresults.where("lower(brand) LIKE lower(?) ", "%#{searchresults_params[:type]}%")).or(Searchresults.where("lower(category) LIKE lower(?) ", "%#{searchresults_params[:type]}%")).exists?            
                    render json: {status: 'SUCCESS', message: 'Products are found.', data: values}, status: :ok
                else 
                    render json: {status: 'ERROR', message: 'Products not found.', data:values}
                end
            end

            private 

            def searchresults_params
                params[:categoryType].permit(:type)
            end 
        end
    end
end 
class Product < ApplicationRecord
    validates :name, :age, :cloth_type, :gender, :imgurl, :size, :price, presence:true
end

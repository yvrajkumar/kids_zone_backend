class Additem < ActiveRecord::Base
    self.table_name = "orders"
    validates :email, presence: true
    validates :product_id, presence: true
    validates :status, presence: true
    validates :quantity, presence: true
    validates :cost, presence: true
end
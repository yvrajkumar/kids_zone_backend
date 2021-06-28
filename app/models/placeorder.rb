class Placeorder < ActiveRecord::Base
    self.table_name = "orders"
    validates :status, presence: true
end
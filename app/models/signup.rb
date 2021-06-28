class Signup < ActiveRecord::Base
    self.table_name = "usersmanagements"
    validates :name, presence: true
    validates :email, presence: true
    validates :password, presence: true
    validates :phone, presence: true
    validates :address, presence: true
end
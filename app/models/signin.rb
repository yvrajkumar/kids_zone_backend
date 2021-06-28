class Signin < ActiveRecord::Base
    self.table_name = "usersmanagements"
    validates :email, presence: true
    validates :password, presence: true
end
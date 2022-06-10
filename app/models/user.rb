class User < ApplicationRecord
    has_secure_password
    has_one :user 
    validates :first_name, presence: true, length: { minimum: 3 }
    validates :email, presence: true 
    validates :password, length: { in: 6..10 }
   

end

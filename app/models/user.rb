class User < ApplicationRecord
    # use bcrypt gem to ensure strong password
    has_secure_password

    validates :username, presence: true, uniqueness: true
    validates :email, uniqueness: true
    validates :password, presence: true, on: :create
end

class User < ApplicationRecord
	# use bcrypt gem to ensure strong password
	has_secure_password

	has_many :likes
	has_many :user_likes, as: :likeable

	validates :username, presence: true, uniqueness: true
	validates :email, uniqueness: true
	validates :password, presence: true, on: :create
end

class Twert < ApplicationRecord
	belongs_to :user
	belongs_to :parent_twert, class_name: "Twert", optional: true

	has_many :replies, class_name: "Twert", foreign_key: "parent_twert_id"
	has_many :likes, as: :likeable

	validates :user, :content, presence: true
end

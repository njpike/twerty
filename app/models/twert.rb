class Twert < ApplicationRecord
	belongs_to :user
	has_many :replies, class_name: "Twert", foreign_key: "parent_twert_id"
	belongs_to :parent_twert, class_name: "Twert", optional: true

	validates :user, :content, presence: true
end

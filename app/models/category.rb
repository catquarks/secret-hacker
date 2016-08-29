class Category < ApplicationRecord
	has_many :secrets
	validates :name, uniqueness: true
end

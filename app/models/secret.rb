class Secret < ApplicationRecord
	belongs_to :key
	accepts_nested_attributes_for :key
	# validates :key, presence: true
	validates :content, presence: true


	def key_string
		key.string
	end
end

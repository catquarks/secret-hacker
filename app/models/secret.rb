class Secret < ApplicationRecord
	belongs_to :key
	accepts_nested_attributes_for :key

	def key_string
		key.string
	end
end

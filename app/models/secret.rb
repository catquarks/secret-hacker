class Secret < ApplicationRecord
	belongs_to :key

	def key_string
		key.string
	end
end

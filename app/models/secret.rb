class Secret < ApplicationRecord
	belongs_to :key
	belongs_to :category
	accepts_nested_attributes_for :key
	# validates :key, presence: true
	validates :content, presence: true


	def key_string
		key.string
	end

	def users_count
		self.key.users.size
	end
end

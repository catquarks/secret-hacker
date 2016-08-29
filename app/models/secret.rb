class Secret < ApplicationRecord
	belongs_to :key
	belongs_to :category
	# validates :key, presence: true
	validates :content, presence: true


	def key_string
		self.key.string
	end

	def users_count
		self.key.users.size
	end
end

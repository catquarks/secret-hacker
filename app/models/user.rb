class User < ApplicationRecord
	has_many :keys_users
	has_many :keys, through: :keys_users
	has_many :secrets, through: :keys
	has_secure_password
	validates :name, presence: true
	validates :name, uniqueness: true
	

	def known_keys_count
		#how many keys this user knows!
		self.keys.count
	end
end

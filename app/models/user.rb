class User < ApplicationRecord
	has_many :keys_users
	has_many :keys, through: :keys_users
	has_secure_password

	def known_keys_count
		#how many keys this user knows!
		self.keys.count
	end
end

class Key < ApplicationRecord
	has_many :keys_users
	has_many :users, through: :keys_users
	has_one :secret


end

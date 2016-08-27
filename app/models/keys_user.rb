class KeysUser < ApplicationRecord
	belongs_to :user
	belongs_to :key
end

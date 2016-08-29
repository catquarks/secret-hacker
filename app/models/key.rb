class Key < ApplicationRecord
	has_many :keys_users
	has_many :users, through: :keys_users
	has_one :secret
	validates :string, presence: true
	validates :string, uniqueness: true
	accepts_nested_attributes_for :secret

end

class Password < ApplicationRecord
  has_many :user_passwords
  has_many :users, through: :user_passwords

  encrypts :user_name, deterministic: true
  encrypts :password

  validates :user_name, presence: true
  validates :password, presence: true
  validates :url, presence: true
end

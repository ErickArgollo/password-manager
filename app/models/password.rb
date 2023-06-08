class Password < ApplicationRecord
  has_many :user_passwords, dependent: :destroy
  has_many :users, through: :user_passwords

  encrypts :password

  validates :username, presence: true
  validates :password, presence: true
  validates :url, presence: true

  def editable?(user)
    user_passwords.find_by(user: user)&.editable?
  end

  def shareable?(user)
    user_passwords.find_by(user: user)&.shareable?
  end

  def deletable?(user)
    user_passwords.find_by(user: user)&.deletable?
  end
end

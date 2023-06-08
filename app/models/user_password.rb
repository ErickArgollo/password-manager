class UserPassword < ApplicationRecord
  ROLES = %w[owner editor viewer].freeze

  belongs_to :user
  belongs_to :password

  validates :role, presence: true, inclusion: { in: ROLES }
end

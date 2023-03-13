class User < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: {case_sensitive: false}, presence: true
  validates :name, presence: true
  validates :password, length: { in: 6..20 }
end

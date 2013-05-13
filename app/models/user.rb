class User < ActiveRecord::Base
  has_secure_password
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :username, presence: true, uniqueness: true, length: 3..12, format: /\A[a-z0-9_.]+\z/
  validates :password, length: { minimum: 6 }, unless: ->{ password_digest.present? }
end

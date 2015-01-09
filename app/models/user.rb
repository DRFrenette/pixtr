class User < ActiveRecord::Base
  has_many :galleries
  has_many :group_memberships, foreign_key: "member_id"

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
end

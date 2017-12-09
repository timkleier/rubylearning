# User model
class User < ApplicationRecord
  validates_uniqueness_of :email
end

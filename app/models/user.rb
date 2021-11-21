class User < ApplicationRecord
  has_many :ratings
  validates :email, uniqueness: true
  before_validation :format_email

private
  def format_email
    email.downcase!
  end
end

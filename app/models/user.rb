class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :password, on: :create

  def administrator?
    false
  end
end

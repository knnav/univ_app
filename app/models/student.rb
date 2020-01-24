class Student < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { minimum: 2,  maximum: 50 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
end
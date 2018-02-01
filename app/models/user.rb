class User < ApplicationRecord
  has_many :articles
  before_save { self.email = email.downcase }
  validates :username,  presence: true, 
                        uniqueness: { case_sensitive: false },
                        length: { minumum: 3, maximum: 25 }
  validates :email,     presence: true, 
                        uniqueness: { case_sensitive: false },
                        length: { minumum: 5, maximum: 150 },
                        format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
end
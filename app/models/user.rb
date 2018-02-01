class User < ApplicationRecord
  # belongs_to :article

  validates :username,  presence: true, 
                        uniqueness: { case_sensitive: false },
                        length: { minumum: 3, maximum: 25 }
  validates :password,  presence: true, 
                        uniqueness: { case_sensitive: false },
                        length: { minumum: 5, maximum: 150 },
                        format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
end
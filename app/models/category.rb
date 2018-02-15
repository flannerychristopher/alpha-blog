class Category < ApplicationRecord
  has_many :article_categories
  has_many :articles, through: :article_categories
  
  validates :name,  presence: true,
                    length: { maximum: 24, minimum: 2 },
                    uniqueness: { case_sensitive: false }
end

class Category < ApplicationRecord
  validates :name,  presence: true,
                    length: { maximum: 24, minimum: 2 },
                    uniqueness: { case_sensitive: false }
end

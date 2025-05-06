class Product < ApplicationRecord
    has_one_attached :featured_image
    has_rich_text :description
    validates :name, :price, presence: :true
end

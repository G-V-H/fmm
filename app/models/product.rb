class Product < ApplicationRecord
    has_many :posts, dependent: :destroy
end

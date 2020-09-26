class Category < ApplicationRecord
    has_many :business, dependent: :destroy
end

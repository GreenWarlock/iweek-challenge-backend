class Business < ApplicationRecord
  belongs_to :category, :foreign_key => 'category_id'
  has_many :business_photo, dependent: :destroy
end

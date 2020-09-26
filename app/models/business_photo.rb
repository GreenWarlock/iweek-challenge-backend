class BusinessPhoto < ApplicationRecord
  belongs_to :business, :foreign_key => 'business_id'
end

class Subcategory < ActiveRecord::Base
	belongs_to :category
	has_many :articles

	validates :name, length: { minimum: 5, maximum: 20 }
end

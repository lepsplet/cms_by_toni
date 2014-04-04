class Category < ActiveRecord::Base
	has_many :subcategories

	validates :name, length: { minimum: 5, maximum: 20 }
end

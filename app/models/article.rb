class Article < ActiveRecord::Base
	belongs_to :subcategory

	validates :name, length: { minimum: 5, maximum: 50 }
	validates :body, length: { minimum: 50,  maximum: 2000 }
end

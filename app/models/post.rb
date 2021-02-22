class Post < ApplicationRecord
	validates :title, presence: true
	validates :description, presence: true


	belongs_to :category_type,  optional: true
end

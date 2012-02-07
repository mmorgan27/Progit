
class Category < ActiveRecord::Base
	has_many :categories
	belongs_to :category

	@name
	validates :name, :uniqueness => true, :presence => true, :length => { :minimum => 3, :maximum => 25 }, :numericality => false, :confirmation => true
end


class Event < ActiveRecord::Base
	belongs_to :catagory
	belongs_to :user
	has_many :predictions

	@description
	@vagueness_score
	@triviality_score

	validates :description, :presence => true, :length => { :minimum => 10, :maximum => 255 }
end

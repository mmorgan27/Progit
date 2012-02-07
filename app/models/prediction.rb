
class Prediction < ActiveRecord::Base

	belongs_to :user
	belongs_to :event

	@user
	@event
	@date_range
	@prediction_date	# when was prediction created
	@yays
	@nays
	@actual_outcome     # yay or nay
end

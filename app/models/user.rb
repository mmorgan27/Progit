
class User < ActiveRecord::Base
	has_many :predictions
	has_many :events

	ADMIN=1
	MODERATOR=2
	REGULAR=3

	@username
	# score is sum of successful weighted votes
	# weighted votes is calculated by (score of prediction) * (days between prediction and date of event)
	@type	# Regular, Admin, Moderator
	@prediction_score
	@yes_vote_score 	# yes votes that were true
	@nay_vote_score		# no votes that were true
	@email
	@password
	@hint
end

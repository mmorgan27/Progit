class DateRangeController < ApplicationController
	def create	# create new date range
		@date_range = DateRange.create(:user = session[:user])
	end
end

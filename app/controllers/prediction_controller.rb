class PredictionController < ApplicationController

	before_filter :get_prediction, :only => [ :edit, :update, :show ]
	before_filter :authorize, :only => [ :edit, :update ]

	def authorize
		if session[:user_id] != @prediction.user_id
			redirect_to(prediction_path,
				:notice => "You do not own this prediction.")
		end
	end

	def get_prediction
		@prediction = Prediction.find(params[:id])
	end

	def show
		respond_to do |format|
			format.html
			format.xml { render :xml => @prediction }
			format.json { render :json => @prediction }
		end
	end

	def vote
		@prediction = Prediction.find(params[:id])

		if session[:user] == nil
			flash[:notice] = "In order to vote, you must first log in."
			redirect_to(login_path)
		end
	end

	def index # list all predictions
		@predictions = params[:user] ? Prediction.where(:user => params[:user]).order(:votes).limit(50) :
										Prediction.order(:votes).limit(10)
	end

	def new # Show new prediction form
		@prediction = Prediction.create(:user => session[:user])
	end

	def edit  # edit a prediction form
		if @prediction.yays != 0 or @prediction.nays != 0
			flash[:notice] = "Predictions are immutable once they have been voted on."
		end
	end

	def create	# create new prediction
		@prediction = Prediction.create(:user => session[:user], :event => params[:event], :daterange => params[:daterange])
	end

	def update # update a prediction
		#@prediction.update_attributes(:status => )
	end

	def destroy # delete a prediction
	end
end

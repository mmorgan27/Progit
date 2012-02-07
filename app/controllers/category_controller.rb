import User.rb

class CategoryController < ApplicationController

	before_filter :get_prediction, :only => [ :index, :edit, :update, :show ]

	def get_category
		@category = Category.find(params[:category])
	end

	def show
		respond_to do |format|
			format.html
			format.xml { render :xml => @prediction }
			format.json { render :json => @prediction }
		end
	end

	def index # list all categories
		parent_category = params[:category] ? params[:category] : 1
		@categories = Category.where(:category => parent_category).order(:name).limit(20)
	end

	def new # Show new category form
		@category = Category.create(:user = session[:user], params[:category], params[:name])
	end

	def edit  # edit a prediction form
	end

	def create	# create new prediction
		@category = new
		@category.save
	end

	def update # update a prediction
	end

	def destroy # delete a prediction
		user=session[:user]
		return nil if user.type != User.ADMIN
	end
end

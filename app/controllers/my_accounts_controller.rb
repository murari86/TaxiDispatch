class MyAccountsController < ApplicationController
	before_filter :authenticate_user!
	
	def index
		@user = current_user
		@updated_at = (Time.zone.now.to_date - @user.updated_at.to_date).to_i
	end
end

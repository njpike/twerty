class TwertsController < ApplicationController
	def index
	end

	def create
		twert = Twert.new(twert_params)

		if twert.save
			redirect_to root_path, notice: "Thanks for your thoughts, I'll toss them out into the wide open ocean polluted with other meaningless thought bottles"
		else
			render :index, notice: "Try again, friend-o"
		end
	end

	def twert_params
		params.require(:twert).permit(:content).merge(user: current_user)
	end
end

class TwertsController < ApplicationController
	before_action :load_twert, only: [:show]

	def index
	end

	def show
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
		params.require(:twert).permit(:content, :parent_twert_id).merge(user: current_user)
	end

	helper_method def hot_twerts
		Twert.last(10)
	end

	helper_method def twert
		@_twert ||= Twert.find_by(id: params[:id])
	end

	private

	def load_twert
		unless (twert)
			redirect_to root_path, notice: "Sorry, we couldn't find that twert"
		end
	end
end

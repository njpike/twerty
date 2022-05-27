class LikesController < ApplicationController
	def create
		likeable_id = params[:likeable_id]
		likeable_type = params[:likeable_type]
		user_id = current_user.id

		like = Like.create({ user_id: user_id, likeable_id: likeable_id, likeable_type: likeable_type })

		# real world, we probably don't count every time we create, instead use some kind of caching for counter (counter cache built in rails feature apparently)
		likeable = likeable_class.find(likeable_id)
		like_count = likeable.likes.count

		# one silly way
			# like.likeable.likes.count
		# another silly way
			# could be a problem with constantize being run for any random input
			# likeable_type.constantize.find(likeable_id)

		render json: { message: "success", like_count: like_count }, status: :ok
	end

	private

	def likeable_class
		case params[:likeable_type]
		when "Twert"
			Twert
		when "User"
			User
		else
			head 418	# easy way to give an http response (http status 418 is the joke "i'm a teapot" code)
		end

	end
end

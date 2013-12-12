module Api::V1
	class Controller < ActionController::Base
		before_filter :authenticate_token!

		private

		def authenticate_token!
			token = params[:token] || request.headers['token']
			if token
				user = User.where(token: token).first
				sign_in(user, store: false) if user
			else
				head :forbidden
			end
		end
	end
end

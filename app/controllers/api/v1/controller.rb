module Api::V1
	class Controller < ActionController::Base
		before_filter :authenticate_token!

		private

		def authenticate_token!
			if token = params[:auth_token].presence
				user = User.where(token: token).first
				sign_in(user, store: false) if user
			else
				head :forbidden
			end
		end
	end
end

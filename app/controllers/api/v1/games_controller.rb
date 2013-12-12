module Api::V1
	class GamesController < Controller
		def index
			@games = Game.joins(:winner, :loser)
		end
	end
end
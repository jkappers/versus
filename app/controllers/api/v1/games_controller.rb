module Api::V1
	class GamesController < Controller
		def index
			@games = Game.joins(:winner, :loser)
		end

    def create
      if Game.where(winner_id: current_user.id, loser_id: game_params[:loser_id]).where("created_at > ?", Time.now - 5.minutes).exists?
        render status: :forbidden, :json => { errors: 'You just posted a win against this player.' }
        return
      end
      @game = Game.new({
        loser_id:  game_params[:loser_id],
        winner: current_user
      })
      
      if @game.save
        render :status => 200, :json => { :success => true }
      else
        render json: @game.errors, status: :unprocessable_entity
      end
    end

    private

      def game_params
        params.require(:game).permit(:winner_id, :loser_id)
      end

	end
end
class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  # GET /games
  # GET /games.json
  def index
    @games = Game.all
    authorize! :read, @games
  end

  # GET /games/1
  # GET /games/1.json
  def show
    authorize! :read, @game
  end

  # GET /games/new
  def new
    @game = Game.new
    @opponents = current_user.opponents
    authorize! :create, @game
  end

  # GET /games/1/edit
  def edit
    authorize! :update, @game
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new({
      loser:  User.find(game_params[:loser_id]),
      winner: current_user
    })
    authorize! :create, @game
    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render action: 'show', status: :created, location: @game }
      else
        format.html { render action: 'new' }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    authorize! :update, @game
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    authorize! :destroy, @game
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:winner_id, :loser_id)
    end
end

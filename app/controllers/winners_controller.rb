class WinnersController < ApplicationController
    before_action :set_player, only: [:show, :edit, :update, :destroy]
    
    #show a list of player filtered by winner = true , only winners!
    def index
        @players = Player.where(winner: true)
    end
    
    def show
    end
    
    private
    # Use callbacks to share common setup or constraints between actions.
        def set_player
          @player = Player.find(params[:id])
        end
    
        # Never trust parameters from the scary internet, only allow the white list through.
        def player_params
          params.require(:player).permit(:email, :lucky_number, :winner)
        end
    
end



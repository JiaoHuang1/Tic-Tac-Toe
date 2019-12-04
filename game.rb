require_relative "board"
require_relative "human_player"
require_relative "computer_player"

class Game
    attr_reader :current_player
    def initialize
        @board = Board.new
        @human_player = HumanPlayer.new
        @computer_player = ComputerPlayer.new
        @current_player = :O
    end

    def switch_players!
        @current_player = (@current_player == :O ? :X : :O)
    end

    def play_turn
        
        human_pos = @human_player.get_move
        until @board.empty?(human_pos)
            puts "this position is taken!"
            human_pos = @human_player.get_move
        end
        @board.place_mark(human_pos, @current_player)
        self.switch_players!
        comp_pos = @computer_player.get_move(@board)
        @board.place_mark(comp_pos, @current_player)
        self.switch_players!
        @computer_player.display(@board)     
    end

    def play
        @human_player.display(@board)
        until @board.over?
            self.play_turn
        end
        if @board.winner == :X
            puts "you lose!"
        else  
            puts "you win!"
        end
    end

end

game = Game.new
game.play


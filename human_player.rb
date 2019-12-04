require_relative "board"
class HumanPlayer  ### :O
    def display(board_instance)
        board_instance.grid.each do |row|
            puts row.join(" ")
        end
    end

    def get_move
        puts "Please enter a position in the format of '0, 0'"
        pos = gets.chomp
        until pos.length == 4 && (0..2).include?(pos[0].to_i) && (0..2).include?(pos[3].to_i) && pos[1] == "," && pos[2] == " "
            puts "Invalid entry. Please enter a position again:"
            pos = gets.chomp
        end
        [pos[0].to_i, pos[3].to_i]
    end
end

# human = HumanPlayer.new
# p human.get_move
# board = Board.new
# human.display(board)
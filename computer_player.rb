require_relative "board"

class ComputerPlayer ### :X
    def display(board_instance)
        board_instance.grid.each do |row|
            puts row.join(" ")
        end
    end

    def get_move(board_instance)
        possible_move = []
        (0..2).each do |row_idx|
            (0..2).each do |col_idx|
                if board_instance.grid[row_idx][col_idx] == "_"
                    possible_move << [row_idx, col_idx]
                end
            end
        end
        possible_move.each do |pos|
            row, col = pos
            other_two_in_a_row = (0..2).reject {|n| n == col}
            return pos if other_two_in_a_row.all? {|c| board_instance.grid[row][c] == :X}
            other_two_in_a_col = (0..2).reject {|n| n == row}
            return pos if other_two_in_a_col.all? {|r| board_instance.grid[r][col] == :X}
            if row == col
                other_two_in_diagonal1 = (0..2).reject {|n| n == row}
                return pos if other_two_in_diagonal1.all? {|idx| board_instance.grid[idx][idx] == :X}
            end
            if row + col == 2
                other_two_in_diagonal2 = (0..2).reject {|n| n == row}
                return pos if other_two_in_diagonal2.all? {|r| board_instance.grid[r][2 - r] == :X}
            end
        end
        random = rand(0...possible_move.length)
        possible_move[random]
    end
end

# computer = ComputerPlayer.new
# board = Board.new
# computer.display(board)
# board.place_mark([0, 2], :O)
# board.place_mark([1, 2], :O)
# computer.display(board)
# p computer.get_move(board)

class Board
    attr_reader :grid
    def initialize
        @grid = Array.new(3) {Array.new(3, '_')}
    end

    def place_mark(pos, mark)
        row, col = pos
        @grid[row][col] = mark
    end

    def empty?(pos)
        row, col = pos
        @grid[row][col] == "_"
    end

    def winner
        (0...3).each do |row|
            return @grid[row][1] if @grid[row][0] == @grid[row][1] && @grid[row][1] == @grid[row][2] && (@grid[row][1] == :O || @grid[row][1] == :X)
        end
        (0...3).each do |col|
            return @grid[1][col] if @grid[0][col] == @grid[1][col] && @grid[1][col] == @grid[2][col] && (@grid[1][col] == :O || @grid[1][col] == :X)
        end
        return @grid[1][1] if (@grid[1][1] == :O || @grid[1][1] == :X) && ((@grid[0][0] == @grid[1][1] && @grid[1][1] == @grid[2][2]) || (@grid[0][2] == @grid[1][1] && @grid[1][1] == @grid[2][0]))
        return false
    end

    def over?
        return true if winner
        false
    end
end

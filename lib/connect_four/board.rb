module ConnectFour
    class Board
        attr_reader :grid
        def initialize(input = {})
            @grid = input.fetch(:grid, default_grid)
        end
        
        def get_cell(x,y)
            grid[y][x]
        end
        
        def set_cell(x,y,value)
            get_cell(x,y).value = value
        end
        
        def game_over
            return :winner if winner?
            return :draw if draw?
            false
        end
        
        def winner?
            winning_positions.each do |winning_position|
                next if winning_position_values(winning_position).any? { |element| element.to_s.empty? }
                return true if winning_position_values(winning_position).all? { |element| element == winning_position_values(winning_position)[0] }
            end
            false
            
        end
        
        def winning_positions
            rows + columns + diagonals
        end
        
        def rows
            grid.map { |row| row[0..3] } + grid.map { |row| row[1..4] } + grid.map { |row| row[2..5] } + grid.map { |row| row[3..6] } 
        end
        
        def columns
            grid.transpose.map { |row| row[0..3] } + grid.transpose.map { |row| row[1..4] } + grid.transpose.map { |row| row[2..5] }
        end        
        
        def diagonals
            [
                [get_cell(0,0), get_cell(1,1), ]
                ]
        end
        
        def winning_position_values(winning_position)
            winning_position.map { |cell| cell.value }
        end
        
        def all_empty(array)
            array.any? { |element| element.to_s.empty? }
        end        
        
        def draw?
            grid.flatten.map { |cell| cell.value }.any? { |element| element.to_s.empty? }
        end        
        
        private
        
        def default_grid
           Array.new(6) { Array.new(7) { Cell.new } }
        end
        
    end
end
      
      
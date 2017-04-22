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
        
        def all_empty(array)
            array.any? { |element| element.to_s.empty? }
        end        

        def any_empty?
          Array.any? { |element| element.to_s.empty? }
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
      
      
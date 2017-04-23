module ConnectFour
    class Game
        attr_reader :players, :board, :current_player, :other_player
        def initialize(players, board = Board.new)
            @players = players
            @board = board
            @current_player, @other_player = players.shuffle            
        end
        
        def switch_players
            @current_player, @other_player = @other_player, @current_player
        end
        
        def solicit_move
            "#{current_player.name}: please enter a column number 1 to 7 to drop your piece"
        end
        
        def get_move(human_move)
            human_move_to_coordinate(human_move)
        end
        
        def first_empty(human_move)
            if board.get_cell(human_move.to_i, 5).value == ""
                5
            elsif board.get_cell(human_move.to_i, 4) == ""
                4
            elsif board.get_cell(human_move.to_i, 3) == ""    
                3
            elsif board.get_cell(human_move.to_i, 2) == ""
                2
            elsif board.get_cell(human_move.to_i, 1) == ""
                1
            else
                0
            end
        end
        
        private
        
        def human_move_to_coordinate(human_move)
            mapping = {
            "1" => [0, first_empty],
            "2" => [1, first_empty],
            "3" => [2, first_empty],
            "4" => [3, first_empty],
            "5" => [4, first_empty],
            "6" => [5, first_empty],
            "7" => [6, first_empty],
            }
            mapping[human_move]
        end
        
        
        
    end
end
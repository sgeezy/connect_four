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
        
        def get_move(human_move = gets.chomp)
            space = human_move.to_i
            space -= 1
            col = board.grid.transpose[space]
            if  col[5].value.empty?
                [space, 5]
                elsif col[4].value.empty?
                [space, 4]
                elsif col[3].value.empty?
                [space, 3]
                elsif col[2].value.empty?
                [space, 2]
                elsif col[1].value.empty?
                [space, 1]
                elsif col[0].value.empty?
                [space, 0]
            else
                "No Space"
            end
        end
               
        def game_over_message
          return "#{current_player.name} won!" if board.game_over == :winner
          return "The game ended in a tie" if board.game_over == :draw
        end
        
        def play
          puts "#{current_player.name} has randomly been selected as the first player"
          while true
            board.formatted_grid
            puts ""
            puts solicit_move
            x, y = get_move
            board.set_cell(x, y, current_player.color)
            if board.game_over
              puts game_over_message
              board.formatted_grid
              return
            else
              switch_players
            end
          end
        end        
        
        
    end
end
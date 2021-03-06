require "spec_helper"
 
module ConnectFour 
    describe Game do
        let (:player1) { Player.new({color: "R", name: "player1"}) }
        let (:player2) { Player.new({color: "B", name: "player2"}) }
        let (:board) { Board.new }
        
        context "#initialize" do
            it "randomly selects a player to start" do
                Array.any_instance.stub(:shuffle) { [player1, player2] }
                game = Game.new([player2, player1])
                expect(game.current_player).to eq(player1)
            end
            
            it "Places the remaining player into other_player" do
                Array.any_instance.stub(:shuffle) { [player1, player2] }
                game = Game.new([player2, player1])
                expect(game.other_player).to eq player2
            end
        end
        
        context "#switch_players" do
            it "will set @current_player to @other_player" do
                game = Game.new([player1, player2])
                other_player = game.other_player
                game.switch_players
                expect(game.current_player).to eq(other_player)
            end
            
            it "will set @current_player to @other_player" do
                game = Game.new([player1, player2])
                current_player = game.current_player
                game.switch_players
                expect(game.other_player).to eq(current_player)
            end            
        end
        
        context "#solicit_move" do
            it "will solicit current_player to make a move" do
                game = Game.new([player1, player2])
                game.stub(:current_player) { player1 }
                expected = "player1: please enter a column number 1 to 7 to drop your piece"
                expect(game.solicit_move).to eq expected
            end
        end
        
        TestCell = Struct.new(:value)
        let(:b_cell) { TestCell.new("B") }
        let(:r_cell) { TestCell.new("R") }
        let(:empty) { TestCell.new } 
        
        # context "#first_empty" do
        #     it "will return the y coordinate of first_empty cell of column from bottom-up" do
        #         game = Game.new([player1,player2])
        #         grid = [[empty,empty,empty,empty,empty,empty,empty],
        #               [empty,empty,empty,empty,empty,empty,empty],
        #               [r_cell,empty,empty,b_cell,empty,empty,empty],
        #               [r_cell,empty,b_cell,r_cell,empty,empty,empty],
        #               [r_cell,empty,r_cell,b_cell,empty,empty,empty],
        #               [b_cell,empty,r_cell,r_cell,empty,empty,empty]]
        #         human_move = "2"
        #       board = Board.new(grid: grid)
        #       expect(game.first_empty(human_move)).to eq 5
        #     end
        # end
        
        
        context "#get_move" do
            
            
            it "will take current_player move of '2' and selects first empty cell bottom-up [1, 5]" do
                game = Game.new([player1, player2])
                expect(game.get_move("2")).to eq [1, 5]
            end
            
            it "will take current_player move of '4' and selects first empty cell bottom-up [3, 5]" do
                game = Game.new([player1, player2], board)
                expect(game.get_move("4")).to eq [3, 5]
            end            
            
            it "will go to the next space up in column if bottom spot is filled" do
               game = Game.new([player1, player2])
               board.set_cell(0,5, "B")
               expect(game.get_move("1")).to eq [0, 4]
            end
        end
        
        context "#game_over_message" do
          it "returns '{current player name} won!' if board shows a winner" do
            game = Game.new([player1, player2])
            allow(game).to receive(:current_player) { player1 }
            allow(game.board).to receive(:game_over) { :winner }
            expect(game.game_over_message).to eq "player1 won!"
          end
    
          it "returns 'The game ended in a tie' if board shows a draw" do
            game = Game.new([player1, player2])
            allow(game).to receive(:current_player) { player1 }
            allow(game.board).to receive(:game_over) { :draw }
            expect(game.game_over_message).to eq "The game ended in a tie"
          end
        end        
        
    end
end


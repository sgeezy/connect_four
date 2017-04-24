require "spec_helper"
 
module ConnectFour 
    describe Board do
    
        context "#initialize" do
            it "initializes with a grid" do
                expect { Board.new(grid: "grid") }.to_not raise_error
            end
            
            it "initializes with 6 rows by default" do
               board = Board.new
               expect(board.grid.size).to eq(6)
            end
            
            it "initializes with 7 cells in each row" do
                board = Board.new
                board.grid.each do |row|
                    expect(row.size).to eq(7)
                end
            end
        end
        
        context "#grid" do
            it "returns the grid" do
                board = Board.new(grid: "check")
                expect(board.grid).to eq "check"
            end
        end
        
        context "#get_cell" do
           it "returns the cell based on the (x, y) coordinate" do
               grid = [["","","","","","",""],["","","","","","","test"],["","","","","","",""],["","","","","","",""],["","","","","","",""],
               ["","","","","","",""]]
               board = Board.new(grid: grid)
               expect(board.get_cell(6,1)).to eq("test")
           end
        end
        
        context "#set_cell" do
            it "gets cell and sets cell to new value" do
                Old = Struct.new(:value)
                grid = [[Old.new("begin"),"","","","","",""],["","","","","","",""],["","","","","","",""],["","","","","","",""],["","","","","","",""],
               ["","","","","","",""]]
               board = Board.new(grid: grid)
               board.set_cell(0, 0, "end")
               expect(board.get_cell(0,0).value).to eq("end")
           end
       end
       
       
       
        TestCell = Struct.new(:value)
        let(:b_cell) { TestCell.new("B") }
        let(:r_cell) { TestCell.new("R") }
        let(:empty) { TestCell.new }
       
       
       context "#game_over" do
           it "returns :winner if winner? is true" do
               board = Board.new
               board.stub(:winner?) { true }
               expect(board.game_over).to eq(:winner)
           end
           
           it "returns :draw if winner? is false and draw? is true" do
               board = Board.new
               board.stub(:winner?) { false }
               board.stub(:draw?) { true }
               expect(board.game_over).to eq(:draw)
           end
           
           it "returns false if winner? is false and draw? is false" do
               board = Board.new
               board.stub(:winner?) { false }
               board.stub(:draw?) { false }
               expect(board.game_over).to be false
           end
           
           it "returns :winner if four consecutive cells of one type are in a row" do
               grid = [[empty,empty,empty,empty,empty,empty,empty],[empty,empty,empty,empty,empty,empty,empty],[r_cell,empty,empty,empty,empty,empty,empty],[r_cell,empty,empty,empty,empty,empty,empty],[r_cell,empty,empty,empty,empty,empty,empty],
               [b_cell,b_cell,b_cell,b_cell,empty,empty,empty]]
               board = Board.new(grid: grid)
               expect(board.game_over).to eq(:winner)
           end
           
           it "returns :winner if four consecutive cells of one type are in a column" do
               grid = [[empty,empty,empty,empty,empty,empty,empty],[r_cell,empty,empty,empty,empty,empty,empty],[r_cell,empty,empty,empty,empty,empty,empty],[r_cell,empty,empty,empty,empty,empty,empty],[r_cell,empty,empty,empty,empty,empty,empty],
               [b_cell,b_cell,b_cell,empty,empty,empty,empty]]
               board = Board.new(grid: grid)
               expect(board.game_over).to eq(:winner)
           end
           
           it "returns :winner if four consecutive cells of one type are in a diagonal" do
               grid = [[empty,empty,empty,empty,empty,empty,empty],
                       [empty,empty,empty,empty,empty,empty,empty],
                       [r_cell,empty,empty,b_cell,empty,empty,empty],
                       [r_cell,r_cell,b_cell,r_cell,empty,empty,empty],
                       [r_cell,b_cell,r_cell,b_cell,empty,empty,empty],
                       [b_cell,r_cell,r_cell,r_cell,empty,empty,empty]]
               board = Board.new(grid: grid)
               expect(board.game_over).to eq(:winner)
           end
           
           it "returns :draw if all spaces are filled and winner? is false" do
               grid = [[r_cell,b_cell,r_cell,b_cell,r_cell,b_cell,r_cell],
                       [b_cell,r_cell,b_cell,r_cell,b_cell,r_cell,b_cell],
                       [b_cell,r_cell,b_cell,r_cell,b_cell,r_cell,b_cell],
                       [r_cell,b_cell,r_cell,b_cell,r_cell,b_cell,r_cell],
                       [r_cell,b_cell,r_cell,b_cell,r_cell,b_cell,r_cell],
                       [b_cell,r_cell,b_cell,r_cell,b_cell,r_cell,b_cell]]
               board = Board.new(grid: grid)
               expect(board.game_over).to eq(:draw)
           end
           
           it "returns false if :winner and :draw are false" do
               grid = [[empty,empty,empty,empty,empty,empty,empty],[empty,empty,empty,empty,empty,empty,empty],[r_cell,empty,empty,empty,empty,empty,empty],[r_cell,empty,empty,empty,empty,empty,empty],[r_cell,empty,empty,empty,empty,empty,empty],
               [b_cell,b_cell,b_cell,empty,empty,empty,empty]]
               board = Board.new(grid: grid)
               expect(board.game_over).to be false
           end
       end
            
        
    end    
end
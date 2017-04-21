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
            
        
    end    
end
require "spec_helper"
 
module ConnectFour
  describe Cell do
    
    context "initialize method" do
        it "is initialized with a value of '' by default" do
            cell = Cell.new
            expect(cell.value).to eq ''
        end
        it "can be initialized with a value of 'R'" do
            cell = Cell.new("R")
            expect(cell.value).to eq "R"
        end
    end
    
    
  end
end
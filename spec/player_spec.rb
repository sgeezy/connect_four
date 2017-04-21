require "spec_helper"
 
module ConnectFour
    describe Player do
    
        context "#initialize" do
            it "raises an exception when initialized with {}" do
               expect { Player.new({}) }.to raise_error
            end
            
            it "does not rais an exception with valid initial input" do
                input = { color: "B", name: "Person" }
                expect { Player.new(input) }.to_not raise_error
            end
        end
        
        context "#color" do
            it "returns the color" do
                input = { color: "R", name: "Person" }
                player = Player.new(input)
                expect(player.color).to eq "R"
            end
        end
        
        context "#name" do
            it "returns the name" do
                input = { color: "R", name: "Person" }
                player = Player.new(input)
                expect(player.name).to eq "Person"
            end
        end
    end
end

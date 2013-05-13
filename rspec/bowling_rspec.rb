
=begin 
	    Rspec para Bowling.rb       
            Jorge Chavarría Rodríguez
=end

require 'bowling.rb'

describe Bowling do 

    before do
        @bowling_game = Bowling.new
    end
 
    
    describe "initialize the bowling game" do    
        it "values of the beginning of the bowling game" do
	    @bowling_game.should_not be_nil
	    expect(@bowling_game.values_list_of_each_throw).to eq([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]) 
	    @bowling_game.calculate_the_score.should equal(0)
	end 
    end   	


    describe "to play" do	
       	before do
	    @bowling_game.knock_down_pins(1, 3)
	    @bowling_game.knock_down_pins(2, 5)
	end

	
	it "some throws without Strike or Spare" do
	    expect(@bowling_game.values_list_of_each_throw).to eq([3,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])
	    @bowling_game.calculate_the_score.should equal(8)
	    @bowling_game.knock_down_pins(3, 4)
	    @bowling_game.knock_down_pins(4, 3)
	    expect(@bowling_game.values_list_of_each_throw).to eq([3,5,4,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])
	    @bowling_game.calculate_the_score.should equal(15)
	end


	it "with 1 Spares" do
	    @bowling_game.knock_down_pins(3, 3)
	    @bowling_game.knock_down_pins(4, 7)
	    expect(@bowling_game.values_list_of_each_throw).to eq([3,5,3,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])
	    @bowling_game.calculate_the_score.should equal(18)

	    @bowling_game.knock_down_pins(5, 4) 
	    expect(@bowling_game.values_list_of_each_throw).to eq([3,5,3,7,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])
	    @bowling_game.calculate_the_score.should equal(26)

	    @bowling_game.knock_down_pins(6, 4)
	    expect(@bowling_game.values_list_of_each_throw).to eq([3,5,3,7,4,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])
	    @bowling_game.calculate_the_score.should equal(30)
	end

	
	it "with 1 Strike" do
	    @bowling_game.knock_down_pins(3, 10) 
	    expect(@bowling_game.values_list_of_each_throw).to eq([3,5,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])
	    @bowling_game.calculate_the_score.should equal(18)
	 	
	    @bowling_game.knock_down_pins(5, 3)
	    @bowling_game.knock_down_pins(6, 5)
	    expect(@bowling_game.values_list_of_each_throw).to eq([3,5,10,0,3,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0])
	    @bowling_game.calculate_the_score.should equal(34)
	end


	it "a complete game without Strikes or Spares" do
	    @bowling_game.knock_down_pins(1, 6) 
	    @bowling_game.knock_down_pins(2, 2) 
	    @bowling_game.knock_down_pins(3, 5) 
	    @bowling_game.knock_down_pins(4, 3) 
	    @bowling_game.knock_down_pins(5, 4) 
	    @bowling_game.knock_down_pins(6, 4) 
	    @bowling_game.knock_down_pins(7, 6) 
	    @bowling_game.knock_down_pins(8, 2) 
	    @bowling_game.knock_down_pins(9, 5) 
	    @bowling_game.knock_down_pins(10, 3) 
	    @bowling_game.knock_down_pins(11, 4) 
	    @bowling_game.knock_down_pins(12, 4) 
	    @bowling_game.knock_down_pins(13, 7) 
	    @bowling_game.knock_down_pins(14, 1) 
	    @bowling_game.knock_down_pins(15, 8) 
	    @bowling_game.knock_down_pins(16, 1) 
	    @bowling_game.knock_down_pins(17, 9) 
	    @bowling_game.knock_down_pins(18, 0) 
	    @bowling_game.knock_down_pins(19, 4) 
	    @bowling_game.knock_down_pins(20, 5) 
	    expect(@bowling_game.values_list_of_each_throw).to eq([6,2,5,3,4,4,6,2,5,3,4,4,7,1,8,1,9,0,4,5,0])
	    @bowling_game.calculate_the_score.should equal(83) 
	end

	it "a complete game with Spares" do
	    @bowling_game.knock_down_pins(1, 6) 
	    @bowling_game.knock_down_pins(2, 4)  # spare
	    @bowling_game.knock_down_pins(3, 5) 
	    @bowling_game.knock_down_pins(4, 3) 
	    @bowling_game.knock_down_pins(5, 4) 
	    @bowling_game.knock_down_pins(6, 6)  # spare
	    @bowling_game.knock_down_pins(7, 7) 
	    @bowling_game.knock_down_pins(8, 3)  # spare
	    @bowling_game.knock_down_pins(9, 5) 
	    @bowling_game.knock_down_pins(10, 3) 
	    @bowling_game.knock_down_pins(11, 4) 
	    @bowling_game.knock_down_pins(12, 6) # spare
	    @bowling_game.knock_down_pins(13, 7) 
	    @bowling_game.knock_down_pins(14, 1) 
	    @bowling_game.knock_down_pins(15, 8) 
	    @bowling_game.knock_down_pins(16, 2) # spare
	    @bowling_game.knock_down_pins(17, 9) 
	    @bowling_game.knock_down_pins(18, 1) # spare
	    @bowling_game.knock_down_pins(19, 4) 
	    @bowling_game.knock_down_pins(20, 5) 
	    expect(@bowling_game.values_list_of_each_throw).to eq([6,4,5,3,4,6,7,3,5,3,4,6,7,1,8,2,9,1,4,5,0])
	    @bowling_game.calculate_the_score.should equal(130) 
	end


	it "a complete game with Stikes" do
	    @bowling_game.knock_down_pins(1, 10) # strike
	    @bowling_game.knock_down_pins(2, 0)  
	    @bowling_game.knock_down_pins(3, 10) # strike
	    @bowling_game.knock_down_pins(4, 0) 
	    @bowling_game.knock_down_pins(5, 4) 
	    @bowling_game.knock_down_pins(6, 2)  
	    @bowling_game.knock_down_pins(7, 7) 
	    @bowling_game.knock_down_pins(8, 1)  
	    @bowling_game.knock_down_pins(9, 10) # strike
	    @bowling_game.knock_down_pins(10, 0) 
	    @bowling_game.knock_down_pins(11, 10) # strike 
	    @bowling_game.knock_down_pins(12, 0) 
	    @bowling_game.knock_down_pins(13, 10) # strike 
	    @bowling_game.knock_down_pins(14, 0) 
	    @bowling_game.knock_down_pins(15, 10) # strike 
	    @bowling_game.knock_down_pins(16, 0) 
	    @bowling_game.knock_down_pins(17, 10) 
	    @bowling_game.knock_down_pins(18, 0) 
	    @bowling_game.knock_down_pins(19, 10) 
	    @bowling_game.knock_down_pins(20, 10) 
	    @bowling_game.knock_down_pins(21, 5) # extra throw 
	    expect(@bowling_game.values_list_of_each_throw).to eq([10,0,10,0,4,2,7,1,10,0,10,0,10,0,10,0,10,0,10,10,5])
	    @bowling_game.calculate_the_score.should equal(229)
	end

	it "a complete game with all the options" do
	    @bowling_game.knock_down_pins(1, 6) 
	    @bowling_game.knock_down_pins(2, 1)  
	    @bowling_game.knock_down_pins(3, 10) 
	    @bowling_game.knock_down_pins(4, 0) 
	    @bowling_game.knock_down_pins(5, 10) 
	    @bowling_game.knock_down_pins(6, 0)  
	    @bowling_game.knock_down_pins(7, 6) 
	    @bowling_game.knock_down_pins(8, 3)  
	    @bowling_game.knock_down_pins(9, 10) 
	    @bowling_game.knock_down_pins(10, 0) 
	    @bowling_game.knock_down_pins(11, 10)  
	    @bowling_game.knock_down_pins(12, 0) 
	    @bowling_game.knock_down_pins(13, 8)  
	    @bowling_game.knock_down_pins(14, 0) 
	    @bowling_game.knock_down_pins(15, 8)  
	    @bowling_game.knock_down_pins(16, 2) 
	    @bowling_game.knock_down_pins(17, 10) 
	    @bowling_game.knock_down_pins(18, 0) 
	    @bowling_game.knock_down_pins(19, 10) 
	    @bowling_game.knock_down_pins(20, 8) 
	    @bowling_game.knock_down_pins(21, 1) 
	    @bowling_game.calculate_the_score.should equal(182)
	end

	it "perfect game" do
	    @bowling_game.knock_down_pins(1, 10) 
	    @bowling_game.knock_down_pins(2, 0) 
	    @bowling_game.knock_down_pins(3, 10) 
	    @bowling_game.knock_down_pins(5, 10) 
	    @bowling_game.knock_down_pins(7, 10) 
	    @bowling_game.knock_down_pins(9, 10) 
	    @bowling_game.knock_down_pins(11, 10) 
	    @bowling_game.knock_down_pins(13, 10)  
	    @bowling_game.knock_down_pins(15, 10)  
	    @bowling_game.knock_down_pins(17, 10) 
	    @bowling_game.knock_down_pins(19, 10) 
	    @bowling_game.knock_down_pins(20, 10) 
	    @bowling_game.knock_down_pins(21, 10) 
	    expect(@bowling_game.values_list_of_each_throw).to eq([10,0,10,0,10,0,10,0,10,0,10,0,10,0,10,0,10,0,10,10,10])
	    @bowling_game.calculate_the_score.should equal(300)
	end
    end



end			

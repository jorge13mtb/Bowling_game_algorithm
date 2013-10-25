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
      @bowling_game.values_list_of_each_throw.should == [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
      @bowling_game.calculate_the_score.should == 0
      @bowling_game.results.should == []
    end
  end	

  describe "to play" do	
    before do
      @bowling_game.knock_down_pins(1, 3)
      @bowling_game.knock_down_pins(2, 5)
    end

	  it "some throws without Strike or Spare" do
      @bowling_game.values_list_of_each_throw.should == [3,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
      @bowling_game.calculate_the_score.should equal(8)
      @bowling_game.results.should == [8]

      @bowling_game.knock_down_pins(3, 4)
      @bowling_game.knock_down_pins(4, 3)
      @bowling_game.values_list_of_each_throw.should == [3,5,4,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
      @bowling_game.calculate_the_score.should equal(15)
      @bowling_game.results.should == [8,15]
    end

    it "with 1 Spares" do
      @bowling_game.knock_down_pins(3, 3)
      @bowling_game.knock_down_pins(4, 7)
      @bowling_game.values_list_of_each_throw.should == [3,5,3,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
      @bowling_game.calculate_the_score.should equal(18)
      @bowling_game.results.should == [8,18]
	
      @bowling_game.knock_down_pins(5, 4)
      @bowling_game.values_list_of_each_throw.should == [3,5,3,7,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
      @bowling_game.calculate_the_score.should equal(26)	
      @bowling_game.knock_down_pins(6, 4)
      @bowling_game.values_list_of_each_throw.should == [3,5,3,7,4,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
      @bowling_game.calculate_the_score.should equal(30)
      @bowling_game.results.should == [8,22,30]
    end
	
    it "with 1 Strike" do
      @bowling_game.knock_down_pins(3, 10)
      @bowling_game.values_list_of_each_throw.should == [3,5,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
      @bowling_game.calculate_the_score.should equal(18)
      @bowling_game.results.should == [8,18]

      @bowling_game.knock_down_pins(5, 3)
      @bowling_game.knock_down_pins(6, 5)
      @bowling_game.values_list_of_each_throw.should == [3,5,10,0,3,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
      @bowling_game.calculate_the_score.should equal(34)
      @bowling_game.results.should == [8,26,34]
    end
  end


  describe "a complete game" do
    before{
      @bowling_game.values_list_of_each_throw = [6,2,5,3,4,4,6,2,5,3,4,4,7,1,8,1,9,0,4,5,0]
    }

    it "without Strikes or Spares" do
      @bowling_game.calculate_the_score.should equal(83)
      @bowling_game.results.should == [8,16,24,32,40,48,56,65,74,83]
    end
  end


  describe "a complete game" do
    before{
      @bowling_game.values_list_of_each_throw = [6,4,5,3,4,6,7,3,5,3,4,6,7,1,8,2,9,1,4,5,0]
    }

    it "with Spares" do
      @bowling_game.calculate_the_score.should equal(130)
      @bowling_game.results.should ==[15,23,40,55,63,80,88,107,121,130]
    end
  end


  describe "a complete game" do
    before{
      @bowling_game.values_list_of_each_throw = [10,0,10,0,4,2,7,1,10,0,10,0,10,0,10,0,10,0,10,10,5]
    }

    it "with Stikes" do
      @bowling_game.calculate_the_score.should equal(229)
      @bowling_game.results.should == [24,40,46,54,84,114,144,174,204,229]
    end
  end


  describe "a complete game" do
    before{
      @bowling_game.values_list_of_each_throw = [6,1,10,0,10,0,6,3,10,0,10,0,8,0,8,2,10,0,10,8,1]
    }

    it "with all the options (strikes, spares and normla throws)" do
      @bowling_game.calculate_the_score.should equal(182)
      @bowling_game.results.should == [7, 33, 52, 61, 89, 107, 115, 135, 163, 182]
    end
  end


  describe "a complete game" do
    before{
      @bowling_game.values_list_of_each_throw = [10,0,10,0,10,0,10,0,10,0,10,0,10,0,10,0,10,0,10,10,10]
    }
	
    it "with perfect game" do
      @bowling_game.calculate_the_score.should equal(300)
      @bowling_game.results.should == [30, 60, 90, 120, 150, 180, 210, 240, 270, 300]
    end
  end
end

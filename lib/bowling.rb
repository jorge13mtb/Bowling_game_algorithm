
=begin
	   Class Bowling
	   Jorge Chavarría Rodríguez
=end

MAX_NUMBER_OF_PINS_IN_THE_GAME = 10 
NUMBER_OF_THE_LAST_NORMAL_THROW = 16


class Bowling

  attr_accessor :values_list_of_each_throw

  def initialize
	  @values_list_of_each_throw = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
  end


  def knock_down_pins(throw_number, number_of_pins_knocked_over)
	  @values_list_of_each_throw[throw_number-1] = number_of_pins_knocked_over
  end


  def calculate_the_score
	  actual_score = 0
    actual_throw_number = 0
	  while actual_throw_number <= @values_list_of_each_throw.length-4 do
	    actual_score += calculate_the_score_of_this_throw(actual_throw_number)
	    actual_throw_number += 2
	  end
	actual_score + calculate_the_score_of_the_last_3_throws
  end


    #             *****          These are private functions            *****

    private


  def calculate_the_score_of_this_throw(throw_number)
	  pins_knocked_over_in_this_turn = @values_list_of_each_throw[throw_number] + @values_list_of_each_throw[throw_number + 1]
    extra_pins = 0

	  if is_a_strike?(throw_number)
	    extra_pins = calculate_extra_pins_by_the_strike(throw_number)

	  elsif is_a_spare?(throw_number)
	    extra_pins = calculate_extra_pins_by_the_spare(throw_number)
    end
	return pins_knocked_over_in_this_turn + extra_pins
  end


  def calculate_the_score_of_the_last_3_throws
 	  @values_list_of_each_throw[18] + @values_list_of_each_throw[19] + @values_list_of_each_throw[20]
  end


  def is_a_strike?(throw_number)
    return true if @values_list_of_each_throw[throw_number] == MAX_NUMBER_OF_PINS_IN_THE_GAME
  end


  def is_a_spare?(throw_number)
    return true if (@values_list_of_each_throw[throw_number]+@values_list_of_each_throw[throw_number+1]) == MAX_NUMBER_OF_PINS_IN_THE_GAME
  end


  def calculate_extra_pins_by_the_strike(throw_number)
    if is_a_strike?(throw_number + 2)
	    if throw_number != NUMBER_OF_THE_LAST_NORMAL_THROW
	        return calculate_the_pins_knocked_over_in_two_throws(throw_number+2, throw_number+4)
	    end
	end
	calculate_the_pins_knocked_over_in_two_throws(throw_number+2, throw_number+3)
  end


  def calculate_extra_pins_by_the_spare(throw_number)
    pins_knocked_over_in_next_throw = @values_list_of_each_throw[throw_number+2] 
  end


  def calculate_the_pins_knocked_over_in_two_throws(throw_number_1, throw_number_2)
	  pins_knocked_over_in_two_throws = @values_list_of_each_throw[throw_number_1] + @values_list_of_each_throw[throw_number_2]
  end
end

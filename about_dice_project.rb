require File.expand_path(File.dirname(__FILE__) + '/neo')

# Implement a DiceSet Class here:
#
 class DiceSet
  attr_reader :values 
  # give an interface in class that is not modifiable
  # i.e. want to know someone's name, but not let others change it
  # ruby shorthand
  # defines methods on the class to read attributes (class = instant varibales)
  # @ makes instance variable 
  # a persons name is instant var 
  # class vari is something everyone has that you share

  def roll(x)
  # roll(x) is the only function to be defined.
  # it takes in the number of dice to be rolled,
  # and assigns a random value (from 1 - 6) to each die.

    @values = (1..x).map{ rand(6) + 1 } # .map = a numerator, like .each, 
  # it maps all numbers in the function and returns all the functions again
  end
  # NOTE:  An @ before a value is an instance variable.
  # "values" is the instance variable, and it becomes an array during the roll() function, since it is not typed initially.
 end

class AboutDiceProject < Neo::Koan
  def test_can_create_a_dice_set
    dice = DiceSet.new
    assert_not_nil dice
  end

  def test_rolling_the_dice_returns_a_set_of_integers_between_1_and_6
    dice = DiceSet.new

    dice.roll(5)
    assert dice.values.is_a?(Array), "should be an array"
    assert_equal 5, dice.values.size
    dice.values.each do |value|
      assert value >= 1 && value <= 6, "value #{value} must be between 1 and 6"
    end
  end

  def test_dice_values_do_not_change_unless_explicitly_rolled
    dice = DiceSet.new
    dice.roll(5)
    first_time = dice.values
    second_time = dice.values
    assert_equal first_time, second_time
  end

  def test_dice_values_should_change_between_rolls
    dice = DiceSet.new

    dice.roll(5)
    first_time = dice.values

    dice.roll(5)
    second_time = dice.values

    assert_not_equal first_time, second_time,
      "Two rolls should not be equal"

    # THINK ABOUT IT:
    #
    # If the rolls are random, then it is possible (although not
    # likely) that two consecutive rolls are equal.  What would be a
    # better way to test this?
  end

  def test_you_can_roll_different_numbers_of_dice
    dice = DiceSet.new

    dice.roll(3)
    assert_equal 3, dice.values.size

    dice.roll(1)
    assert_equal 1, dice.values.size
  end

end

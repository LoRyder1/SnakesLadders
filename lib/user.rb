class User
  attr_reader :current_space
  def initialize
    @current_space = 0
  end

  def move num_of_spaces
    if @current_space + num_of_spaces <= 100
      @current_space += num_of_spaces
    end
  end

  def move_back num_of_spaces
    if current_space - num_of_spaces < 0
      current_space = 0
    else
      current_space -= num_of_spaces
    end
  end

end
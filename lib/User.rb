class User
  attr_reader :position, :name
  def initialize name
    @position = 0
    @name = name
  end

  def move num_of_spaces
    if @position + num_of_spaces <= 100
      @position += num_of_spaces
    end
  end

  def move_back num_of_spaces
    if @position - num_of_spaces < 0
      @position = 0
    else
      @position -= num_of_spaces
    end
  end

end

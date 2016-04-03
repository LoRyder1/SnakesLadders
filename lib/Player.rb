class Player
    # declare instance variables
    @name
    @position
    @max_position

    # set access scope for instance variables
    attr_reader :name, :position

    # initialize the Player object
    def initialize name, max_position
        @name         = name
        @position     = 0
        @max_position = max_position
    end

    def move number_of_spaces
        new_position = @position + number_of_spaces

        # if the new position is greater than the max, don't move the Player
        if (new_position <= @max_position)
            @position = new_position
        end
    end

    def move_back number_of_spaces
        new_position = @position - number_of_spaces

        # if the new position is less than zero, send Player back to the start
        if (new_position < 0)
            @position = 0
        else
            @position = new_position
        end
    end
end

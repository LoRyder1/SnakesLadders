class Space
    # declare instance variables
    @type
    @spaces_to_move

    # set access scope for instance variables
    attr_reader :type, :spaces_to_move

    # initialize the Space object
    def initialize
        @type           = 'normal'
        @spaces_to_move = 0
    end

    # transform the Space into a different type (snake or ladder)
    def transform type
        # ensure type is allowed
        @type = type
        case type
        when 'snake'
            @spaces_to_move = - rand(1..10)
        when 'ladder'
            @spaces_to_move = rand(1..10)
        end
    end
end

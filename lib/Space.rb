class Space
    attr_reader :spaces_to_move
    attr_accessor :type

    def initialize
        @type           = 'normal'
        @spaces_to_move = 0
    end

    def setType type
        # make sure passed type is in allowed types list
        case type
        when 'snake', 'ladder'
            @type           = type
            @spaces_to_move = rand(1..10)
        end
    end
end

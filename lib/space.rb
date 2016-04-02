class Space
    attr_reader :type, :spaces_to_move

    def initialize type
        # make sure passed type is in allowed types list
        case type
        when 'snake', 'ladder', 'normal'
            @type = type
        else
            @type = 'normal'
        end

        if @type == 'snake' || @type == 'ladder'
            @spaces_to_move = rand(1..10)
        else
            @spaces_to_move = 0
        end
    end
end

class Boat
    def initialize
        @ship_x = 0
        @ship_y = 0 
        @waypoint_x = 10
        @waypoint_y = 1
    end

    def drive(input)
        input.each{|line| step(line)}
    end

    def to_s
        str = ""
        str += "Boat X: #{@ship_x} Y: #{@ship_y}\n"
        str += "Waypoint X: #{@waypoint_x} Y:#{@waypoint_y}\n"
        str
    end

    def manhattan_distance
        @ship_x.abs + @ship_y.abs
    end

    private
    def step(line)
        key = line[0]
        magnitude = line.slice(1..-1).to_i

        case key
        when 'F'
            @ship_x += magnitude * @waypoint_x
            @ship_y += magnitude * @waypoint_y
        when 'N'
            @waypoint_y += magnitude
        when 'S'
            @waypoint_y -= magnitude
        when 'E'
            @waypoint_x += magnitude
        when 'W'
            @waypoint_x -= magnitude
        when 'R'
            new_waypoint_location = rotate('right', magnitude)
            @waypoint_x = new_waypoint_location[0]
            @waypoint_y = new_waypoint_location[1]
        when 'L'
            new_waypoint_location = rotate('left', magnitude)
            @waypoint_x = new_waypoint_location[0]
            @waypoint_y = new_waypoint_location[1]
        end
    end

    def rotate(direction, degrees)
        if direction == 'left'
            if degrees == 90
                return [-@waypoint_y, @waypoint_x]
            elsif degrees == 180
                return [-@waypoint_x, -@waypoint_y]
            else degrees == 270
                return [@waypoint_y, -@waypoint_x]
            end
        else
            if degrees == 90
                return [@waypoint_y, -@waypoint_x]
            elsif degrees == 180
                return [-@waypoint_x, -@waypoint_y]
            else degrees == 270
                return [-@waypoint_y, @waypoint_x]
            end
        end
        [waypoint_x, waypoint_y]
    end
end

file = File.open('input.txt')
input_lines = file.readlines.map(&:chomp)

boat = Boat.new
boat.drive(input_lines)
puts boat.manhattan_distance
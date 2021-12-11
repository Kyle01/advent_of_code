file = File.open('input.txt')
lines = file.readlines.map(&:chomp)

def find_basin_size(survey, col, row)
    seen = []
    size = 0
    queue = [[col, row]]
    while queue.length > 0
        current = queue.shift
        size += 1
        seen << current
        if current[0] + 1 < survey[0].length
            next_point = [current[0] + 1, current[1]]
            queue << next_point if !seen.include?(next_point) && survey[next_point[1]][next_point[0]] != 9 && !queue.include?(next_point)
        end
        if current[0] - 1 >= 0
            next_point = [current[0] - 1, current[1]]
            queue << next_point if !seen.include?(next_point) && survey[next_point[1]][next_point[0]] != 9 && !queue.include?(next_point)
        end
        if current[1] + 1 < survey.length
            next_point = [current[0], current[1] + 1]
            queue << next_point if !seen.include?(next_point) && survey[next_point[1]][next_point[0]] != 9 && !queue.include?(next_point)
        end
        if current[1] - 1 >= 0
            next_point = [current[0], current[1] - 1]
            queue << next_point if !seen.include?(next_point) && survey[next_point[1]][next_point[0]] != 9 && !queue.include?(next_point)
        end
    end
    size
end

def find_basin_sizes(survey)
    low_points = []
    survey.each_with_index do |row, row_index|
        row.each_with_index do |point, point_index|
            checker = true
            if row_index + 1 < survey.length 
                checker = false if point >= survey[row_index + 1][point_index]
            end
            if row_index - 1 >= 0
                checker = false if point >= survey[row_index - 1][point_index]
            end
            if point_index + 1 < row.length
                checker = false if point >= survey[row_index][point_index + 1]
            end
            if point_index - 1 >= 0
                checker = false if point >= survey[row_index][point_index - 1]
            end
            low_points << find_basin_size(survey, point_index, row_index) if checker
        end
    end
    low_points
end

survey = []
lines.each{|line| survey << line.split('').map(&:to_i)}
basin_sizes = find_basin_sizes(survey)
puts basin_sizes.max(3).reduce(:*)
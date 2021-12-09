file = File.open('input.txt')
lines = file.readlines.map(&:chomp)

def basin_size(survey, row_index, column_index, current_size, known_spots)
    puts "row_index: #{row_index}, column_index: #{column_index}, current_size: #{current_size}"
    # check up 
    if row_index - 1 >= 0 && known_spots.none?{|x| x == "#{row_index - 1},#{column_index}"}
        next_spot = survey[row_index - 1][column_index]
        if next_spot != 9
            basin_size(survey, row_index - 1, column_index, current_size + 1, known_spots << "#{row_index},#{column_index}")
        end
    end
    # check down
    if row_index + 1 < survey.length - 1 && known_spots.none?{|x| x == "#{row_index + 1},#{column_index}"}
        next_spot = survey[row_index + 1][column_index]
        if next_spot != 9 
            basin_size(survey, row_index + 1, column_index, current_size + 1, known_spots << "#{row_index},#{column_index}")
        end
    end
    # check left
    if column_index - 1 >= 0 && known_spots.none?{|x| x == "#{row_index},#{column_index - 1}"}
        next_spot = survey[row_index][column_index - 1]
        if next_spot != 9
            basin_size(survey, row_index, column_index - 1, current_size + 1, known_spots << "#{row_index},#{column_index}")
        end
    end
    # check right
    if column_index + 1 < survey[row_index].length - 1 && known_spots.none?{|x| x == "#{row_index},#{column_index + 1}"}
        next_spot = survey[row_index][column_index + 1]
        if next_spot != 9 
            basin_size(survey, row_index, column_index + 1, current_size + 1, known_spots << "#{row_index},#{column_index}")
        end
    end
    current_size
end

def find_low_points(survey)
    basin_sizes = []
    survey.each_with_index do |row, row_index|
        row.each_with_index do |point, column_index|
            checker = true
            if row_index + 1 < survey.length 
                checker = false if point >= survey[row_index + 1][column_index]
            end
            if row_index - 1 >= 0
                checker = false if point >= survey[row_index - 1][column_index]
            end
            if column_index + 1 < row.length
                checker = false if point >= survey[row_index][column_index + 1]
            end
            if column_index - 1 >= 0
                checker = false if point >= survey[row_index][column_index - 1]
            end
            if checker && survey[row_index][column_index] != 1 && basin_sizes.length < 1
                basin_sizes << basin_size(survey, row_index, column_index, 1, [])
            end
        end
    end
    puts basin_sizes.join(',')
    basin_sizes.max(3)
end

survey = []
lines.each{|line| survey << line.split('').map(&:to_i)}
find_low_points(survey).reduce(:*)
file = File.open('input.txt')
lines = file.readlines.map(&:chomp)

def find_low_points(survey)
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
            low_points << point + 1 if checker
        end
    end
    low_points
end

survey = []
lines.each{|line| survey << line.split('').map(&:to_i)}
puts find_low_points(survey).reduce(:+)
lines = File.open('input.txt').readlines.map(&:chomp)

x = 1
cycle = 0
diagram = [[], [], [], [], [], []]
lines.each_with_index do |line, i|
    code = line.split(' ')[0]

    if code == 'noop'
        draw_row = cycle / 40
        shape = (x-1..x+1).include?(cycle % 40) ? '#' : '.'
        diagram[draw_row] << shape
        cycle += 1
    else
        draw_row = cycle / 40
        shape = (x-1..x+1).include?(cycle % 40) ? '#' : '.'
        diagram[draw_row] << shape
        cycle += 1

        draw_row = cycle / 40
        shape = (x-1..x+1).include?(cycle % 40) ? '#' : '.'
        diagram[draw_row] << shape
        cycle += 1

        x += line.split(' ')[1].to_i
    end
end

diagram.each {|line| puts line.join('')}
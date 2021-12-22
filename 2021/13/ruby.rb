file = File.open('input.txt')
lines = file.readlines.map(&:chomp)
dot_locations = []
fold_instructions = []

def count_dots(paper)
    count = 0 
    paper.each do |row|
        row.each do |char|
            if char == '#'
                count += 1
            end
        end
    end
    count
end

# Create dot and fold instruction arrays
past_break = false
lines.each do |line|
    past_break = true if line == ''
    if !past_break
        dot_locations << line.split(',').map(&:to_i)
    else
        fold_instructions << line.split('g ')[1] if line != ''
    end
end

# Construct Paper object
largest_x = dot_locations.map { |x, y| x }.max + 1
largest_y = dot_locations.map { |x, y| y }.max + 1
paper = []
j = 0 
while j < largest_y 
    i = 0
    row = []
    while i < largest_x
        row << '.'
        i += 1
    end
    paper << row
    j += 1
end
dot_locations.each do |x, y|
    paper[y][x] = '#'
end
puts paper.map { |row| row.join }.join("\n")
puts "\n"
## Compute fold instructions
fold_instructions.each do |instruction|
    if instruction[0] == 'y'
        fold_index = instruction.split('=').last.to_i
        new_paper = []
        j = 0 
        while j < fold_index
            k = 0
            new_row = []
            while k < paper[0].length
                value = paper[j][k]
                value = '#' if paper[paper.length - 1 - j][k] == '#'
                new_row << value
                k += 1
            end
            new_paper << new_row
            j += 1
        end
        paper = new_paper
        puts paper.map { |row| row.join }.join("\n")
        puts count_dots(paper)
        puts "\n"
    else
        fold_index = instruction.split('=').last.to_i
        new_paper = []
        j = 0 
        while j < paper.length
            k = 0
            new_row = []
            while k < fold_index
                value = paper[j][k]
                value = '#' if paper[j][paper[0].length - 1 - k] == '#'
                new_row << value
                k += 1
            end
            new_paper << new_row
            j += 1
        end
        paper = new_paper
        puts paper.map { |row| row.join }.join("\n")
        puts count_dots(paper)
        puts "\n"
    end
end
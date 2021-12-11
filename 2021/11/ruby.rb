file = File.open('input.txt')
lines = file.readlines.map(&:chomp)

def construct_grid (lines)
  grid = []
  lines.each do |line|
    grid << line.split('').map(&:to_i)
  end
  grid
end

def print_grid (grid, blasts, steps)
  grid.each do |row|
    puts row.join
  end
  puts "Blasts: #{blasts} Steps: #{steps}"
end

def increase_one(grid)
    grid.each_with_index do |row, i|
        row.each_with_index do |cell, j|
          if cell.to_i <= 8
              grid[i][j] = grid[i][j].to_i + 1
          else
              grid[i][j] = 0
          end
        end
    end
    grid
end

def has_sites_remaining(grid)
  has_sites = false
  grid.each do |row|
    row.each do |cell|
      if cell == 'A'
        has_sites = true
      end
    end
  end
  has_sites
end

def in_sync(grid)
  test_value = grid[0][0]
  in_sync = true
  grid.each do |row|
    row.each do |cell|
      if cell != test_value
        in_sync = false
      end
    end
  end
  in_sync
end

def handle_blast_sites(grid)
  blasts = 0 
  while has_sites_remaining(grid)
    grid.each_with_index do |row, i|
      row.each_with_index do |cell, j|
        if cell == 'A'
          blasts += 1
          # get left cell
          if j > 0
            if grid[i][j-1].to_s == '9'
              grid[i][j-1] = 'A'
            elsif grid[i][j-1].to_i.to_s == grid[i][j-1].to_s
              grid[i][j-1] = (grid[i][j-1].to_i + 1).to_s
            end  
          end
          # get right cell
          if j < grid[i].length - 1
            if grid[i][j+1].to_s == '9'
              grid[i][j+1] = 'A'
            elsif grid[i][j+1].to_i.to_s == grid[i][j+1].to_s
              grid[i][j+1] = (grid[i][j+1].to_i + 1).to_s
            end 
          end
          # get top cell
          if i > 0
            if grid[i-1][j].to_s == '9'
              grid[i-1][j] = 'A'
            elsif grid[i-1][j].to_i.to_s == grid[i-1][j].to_s
              grid[i-1][j] =( grid[i-1][j].to_i + 1).to_s
            end 
          end
          # get bottom cell
          if i < grid.length - 1
            if grid[i+1][j].to_s == '9'
              grid[i+1][j] = 'A'
            elsif grid[i+1][j].to_i.to_s == grid[i+1][j].to_s
              grid[i+1][j] = (grid[i+1][j].to_i + 1).to_s
            end
          end
          # get top left cell
          if i > 0 && j > 0
            if grid[i-1][j-1].to_s == '9'
              grid[i-1][j-1] = 'A'
            elsif grid[i-1][j-1].to_i.to_s == grid[i-1][j-1].to_s
              grid[i-1][j-1] = (grid[i-1][j-1].to_i + 1).to_s
            end
          end
          # get top right cell
          if i > 0 && j < grid[i].length - 1
            if grid[i-1][j+1].to_s == '9'
              grid[i-1][j+1] = 'A'
            elsif grid[i-1][j+1].to_i.to_s == grid[i-1][j+1].to_s
              grid[i-1][j+1] = (grid[i-1][j+1].to_i + 1).to_s
            end
          end
          # get bottom left cell
          if i < grid.length - 1 && j > 0
            if grid[i+1][j-1].to_s == '9'
              grid[i+1][j-1] = 'A'
            elsif grid[i+1][j-1].to_i.to_s == grid[i+1][j-1].to_s
              grid[i+1][j-1] = (grid[i+1][j-1].to_i + 1).to_s
            end
          end
          # get bottom right cell
          if i < grid.length - 1 && j < grid[i].length - 1
            if grid[i+1][j+1].to_s == '9'
              grid[i+1][j+1] = 'A'
            elsif grid[i+1][j+1].to_i.to_s == grid[i+1][j+1].to_s
              grid[i+1][j+1] = (grid[i+1][j+1].to_i + 1).to_s
            end
          end
          grid[i][j] = 'X'
        end
      end
    end
  end
  grid.each_with_index do |row, i|
    row.each_with_index do |cell, j|
      if cell == 'X'
        grid[i][j] = 0
      end
    end
  end
  {grid: grid, blasts: blasts}
end

def handle_blasts (grid)
  grid.each_with_index do |row, i|
    row.each_with_index do |cell, j|
      if cell.to_i == 0
        grid[i][j] = 'A'
      end
    end
  end
  step = handle_blast_sites(grid)
  {grid: step.fetch(:grid), blasts: step.fetch(:blasts)}
end

def do_steps (grid, steps)
  blasts = 0
  steps.times do |i|
    grid = increase_one(grid)
    stepped = handle_blasts(grid)
    grid = stepped.fetch(:grid)
    blasts += stepped.fetch(:blasts)
    print_grid(grid, blasts, i+1)
    break if in_sync(grid)
    puts "\n"
  end
end

grid = construct_grid(lines)
print_grid(grid, 0, 0)
puts "\n"
do_steps(grid, 1000)
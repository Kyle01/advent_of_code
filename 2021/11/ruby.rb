file = File.open('input.txt')
lines = file.readlines.map(&:chomp)

def construct_grid (lines)
  grid = []
  lines.each do |line|
    grid << line.split('').map(&:to_i)
  end
  grid
end

def print_grid (grid)
  grid.each do |row|
    puts row.join
  end
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


def handle_blasts (grid)
  grid.each_with_index do |row, i|
    row.each_with_index do |cell, j|
      if cell.to_i == 0
        grid[i][j] = 'A'
      end
    end
  end

  grid.each_with_index do |row, i|
    row.each_with_index do |cell, j|
      if cell == 'A'
        # get left cell
        if j > 0
          if grid[i][j-1] == '9'
            grid[i][j-1] = 'A'
          elsif grid[i][j-1].to_i.to_s == grid[i][j-1].to_s
            grid[i][j-1] = (grid[i][j-1].to_i + 1).to_s
          end  
        end
        # get right cell
        if j < grid[i].length - 1
          if grid[i][j+1] == '9'
            grid[i][j+1] = 'A'
          elsif grid[i][j+1].to_i.to_s == grid[i][j+1].to_s
            grid[i][j+1] = (grid[i][j+1].to_i + 1).to_s
          end 
        end
        # get top cell
        if i > 0
          if grid[i-1][j] == '9'
            grid[i-1][j] = 'A'
          elsif grid[i-1][j].to_i.to_s == grid[i-1][j].to_s
            grid[i-1][j] =( grid[i-1][j].to_i + 1).to_s
          end 
        end
        # get bottom cell
        if i < grid.length - 1
          if grid[i+1][j] == '9'
            grid[i+1][j] = 'A'
          elsif grid[i+1][j].to_i.to_s == grid[i+1][j].to_s
            grid[i+1][j] = (grid[i+1][j].to_i + 1).to_s
          end
        end
        # get top left cell
        if i > 0 && j > 0
          if grid[i-1][j-1] == '9'
            grid[i-1][j-1] = 'A'
          elsif grid[i-1][j-1].to_i.to_s == grid[i-1][j-1].to_s
            grid[i-1][j-1] = (grid[i-1][j-1].to_i + 1).to_s
          end
        end
        # get top right cell
        if i > 0 && j < grid[i].length - 1
          if grid[i-1][j+1] == '9'
            grid[i-1][j+1] = 'A'
          elsif grid[i-1][j+1].to_i.to_s == grid[i-1][j+1].to_s
            grid[i-1][j+1] = (grid[i-1][j+1].to_i + 1).to_s
          end
        end
        # get bottom left cell
        if i < grid.length - 1 && j > 0
          if grid[i+1][j-1] == '9'
            grid[i+1][j-1] = 'A'
          elsif grid[i+1][j-1].to_i.to_s == grid[i+1][j-1].to_s
            grid[i+1][j-1] = (grid[i+1][j-1].to_i + 1).to_s
          end
        end
        # get bottom right cell
        if i < grid.length - 1 && j < grid[i].length - 1
          if grid[i+1][j+1] == '9'
            grid[i+1][j+1] = 'A'
          elsif grid[i+1][j+1].to_i.to_s == grid[i+1][j+1].to_s
            grid[i+1][j+1] = (grid[i+1][j+1].to_i + 1).to_s
          end
        end
        grid[i][j] = 'X'
      end
    end
  end
  grid
end

def step (grid)
    grid = increase_one(grid)
    gird = handle_blasts(grid)
    grid
end

grid = construct_grid(lines)
print_grid(grid)
puts "\n"
grid = step(grid)
print_grid(grid)

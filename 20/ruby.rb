file = File.open('test.txt')
file = File.open('input.txt')
input_lines = file.readlines.map(&:chomp)

tiles = {}
tile = []
name = ""
input_lines.each do |line|
    if line.include?('Tile')
        name = line 
        tile = []
    elsif line == ''
        tiles[name] = tile 
    else
        tile << line 
    end
end
tiles[name] = tile

puts tiles.keys
puts square_size = Integer(Math.sqrt(tiles.keys.length))

def rotate_tile(tile, degrees)
    if degrees == 90

    elsif degrees == 180
        
    else 
        
    end
end
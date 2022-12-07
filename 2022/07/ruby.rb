class Directory 
    # attr_reader :folders, :pwd
    def initialize(pwd, lines)
        @pwd = pwd
        @files = []
        @folders = []

        lines.each do |line|

        end
    end

    def to_s
        "#{pwd} - #{size}"
    end

    def size 
        @files.inject(:+) + @folders.map(&:size).inject(:+)
    end

    def level 
        @pwd.scan(/(?=#{"\/"})/).count
    end

    def add_directory(pwd, input)
        @folders << Directory.new(pwd, input)
    end

    def larger_than?(value)
        size > value
    end
end

lines = File.open('input.txt').readlines.map(&:chomp)
# dir = Directory.new("/a/")
current_path = nil
root_directory = nil
current_directory = nil
j = 1
k = 3
while j < lines.length
    line = lines[j]
    if line == '$ cd /'
        # set root directory 
        current_path = '/'
        while lines[k][0] != '$'
            k += 1
        end
        root_directory = Directory.new(current_path, lines[j+2..k-1])
        j = k
    if line == '$ ls'

    elsif line == '$ cd .. '
        
    else # should only be cd into directory 
        current_path += "#{line.split(' ')[2]}/"
    end
end

puts root_directory

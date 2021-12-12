file = File.open('input.txt')
lines = file.readlines.map(&:chomp)

class Node 
    attr_accessor :children, :large, :name
    def initialize(name, children = nil)
        @name = name
        @children = [children]
        @large = name.upcase == name ? true : false
    end

    def add_child(child)
        @children << child
    end

    def to_s
        str = "#{@name} -> "
        @children.each do |child|
            str += "#{child}"
        end
        str
    end
end

first = lines[0].split('-')[0]
second = lines[0].split('-')[1]
tree = Node.new(first, Node.new(second))

k = 1 
while k < lines.length
    first = lines[k].split('-')[0] 
    second = lines[k].split('-')[1]
    pointer = tree
    while pointer != nil
        if first = pointer.name
            pointer.add_child(Node.new(second))
            break
        elsif second = pointer.name
            pointer.add_child(Node.new(first))
            break
        else 
            pointer = pointer.children[0]
        end
    end
    tree = pointer
    k += 1 
end
puts  tree
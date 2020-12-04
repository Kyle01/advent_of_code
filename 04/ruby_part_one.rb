file = File.open('input.txt')
input_lines = file.readlines.map(&:chomp)

class Passports
    def initialize(passport_lines)
        @byr = nil
        @iyr = nil
        @eyr = nil
        @hgt = nil
        @hcl = nil
        @ecl = nil
        @pid = nil
        @cid = nil

        passport_lines.each do |line|
            parse_line(line)
        end
    end

    def valid?
        @byr != nil &&
        @iyr != nil &&
        @eyr != nil &&
        @hgt != nil &&
        @hcl != nil &&
        @ecl != nil &&
        @pid != nil
    end

    def to_s
        str = ""
        str += "Passport #{valid?} \n"
        str += "Birth Year: #{@byr} \n"
        str += "Issue Year: #{@iyr} \n"
        str += "Expiration Year: #{@eyr} \n"
        str += "Height: #{@hgt} \n"
        str += "Hair Color: #{@hcl} \n"
        str += "Eye Color: #{@ecl} \n"
        str += "Passport ID: #{@pid} \n"
        str += "Country ID: #{@cid} \n"
        str
    end

    private
    def parse_line(line)
        fields = line.split(' ')
        fields.each do |field|
            key = field.split(':')[0]
            value = field.split(':')[1]

            self.instance_variable_set("@#{key}", value)
        end
    end
end


def create_passport_input(lines)
    passports = []
    passport = []

    lines.each do |line|
        if line == ""
            passports << passport
            passport = []
        else 
            passport << line
        end
    end
    passports << passport
end

passport_inputs = create_passport_input(input_lines)
valid_passports = 0 

passport_inputs.each do |input|
    passport = Passports.new(input)
    valid_passports += 1 if passport.valid? 
end

puts valid_passports
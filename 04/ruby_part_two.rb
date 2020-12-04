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

        @byr = @byr.to_i
        @iyr = @iyr.to_i
        @eyr = @eyr.to_i
    end

    def valid?
        valid_birth_year? &&
        valid_issue_date? && 
        valid_expiration_date? && 
        valid_height? && 
        valid_hair_color? && 
        valid_eye_color? && 
        valid_passport_id?
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
        str += "Country ID: #{@cid} \n \n"
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

    def valid_birth_year?
        @byr >= 1920 && @byr <= 2002
    end

    def valid_issue_date?
        @iyr >= 2010 && @iyr <= 2020
    end

    def valid_expiration_date?
        @eyr >= 2020 && @eyr <= 2030
    end

    def valid_height?
        return false unless @hgt

        if @hgt.include?('cm')
            number_height = @hgt.chomp('cm').to_i
            return number_height >= 150 && number_height <= 193
        elsif @hgt.include?('in')
            number_height = @hgt.chomp('in').to_i
            return number_height >= 59 && number_height <= 76
        end
        
        false 
    end

    def valid_hair_color?
        return false unless @hcl

        @hcl[0] == '#' && @hcl.length == 7
    end

    def valid_eye_color?
        @ecl == 'amb' ||
        @ecl == 'blu' ||
        @ecl == 'brn' ||
        @ecl == 'gry' ||
        @ecl == 'grn' ||
        @ecl == 'hzl' ||
        @ecl == 'oth' 
    end

    def valid_passport_id?
        return false unless @pid

        @pid.length == 9
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
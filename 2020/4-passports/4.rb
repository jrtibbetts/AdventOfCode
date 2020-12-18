#!/usr/bin/env ruby

part_1_valid_passport_count = 0
part_2_valid_passport_count = 0

def part_1_valid?(passport)
    true
end

def part_2_valid?(passport)
    p passport
    passport.split.each { | entry |
        (field, value) = entry.split(':')
        case field
        when /byr/
            if 1920 <= value.to_i && value.to_i <= 2002
                return false
            end 
        when /iyr/
            if 2010 <= value.to_i && value.to_i <= 2020
                return false
            end
        when /eyr/
            if 2020 <= value.to_i && value.to_i <= 2030
                return false
            end
        when /hgt/
            matches = /(\d*)([in|cm])/.match(value)

            if matches == nil
                p "Height is in the wrong format"
                return false
            end

            measurement = $1.to_i
            units = $2.to_s

            p "Height: " + measurement.to_s + units

            if units == 'cm'
                if measurement < 150 || measurement > 193
                    return false
                end
            else
                if measurement < 59 || measurement > 76
                    return false
                end
            end
        when /hcl/
            if !/\#[a-f0-9]{6}/.match?(value)
                p "Wrong hair color: " + value
                return false
            end
        when /ecl/
            if !"amb blu brn gry grn hzl oth".split.include?(value)
                p "Wrong eye color: " + value
            end
        when /pid/
            if !/[0-9]{9}/.match?(value)
                p "Wrong passport number: " + value
            end
        end
    }

    true
end

IO.read("4.input").split("\n\n").each { | line |
    colon_count = line.count(':')

    if colon_count == 8 || (colon_count == 7 && !line.include?("cid:"))
        if part_1_valid?(line)
            part_1_valid_passport_count += 1
        end

        if part_2_valid?(line)
            part_2_valid_passport_count += 1
        end
    end
}

p "Valid passport count, part 1: " + part_1_valid_passport_count.to_s
p "Valid passport count, part 2: " + part_2_valid_passport_count.to_s

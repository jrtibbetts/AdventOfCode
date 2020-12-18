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
            if !(1920..2002).include? value.to_i
                p "Wrong birth year: " + value
                return false
            end 
        when /iyr/
            if !(2010..2020).include? value.to_i
                p "Wrong issue year: " + value
                return false
            end
        when /eyr/
            if !(2020..2030).include? value.to_i
                p "Wrong expiration year: " + value
                return false
            end
        when /hgt/
            matches = /(\d*)(in|cm)/.match(value)

            if matches == nil
                p "Wrong height format: " + value
                return false
            end

            measurement = matches[1].to_i
            units =  matches[2].to_s

            if units == 'cm'
                if !(150..193).include? measurement
                    p "Wrong centimeters value: " + measurement.to_s
                    return false
                end
            else
                if !(59..76).include? measurement
                    p "Wrong inches value: " + measurement.to_s
                    return false
                end
            end
        when /hcl/
            if !/\#[a-f0-9]{6}/.match?(value)
                p "Wrong hair color: " + value
                return false
            end
        when /ecl/
            if !("amb blu brn gry grn hzl oth".split.include? value)
                p "Wrong eye color: " + value
                return false
            end
        when /pid/
            if !/[0-9]{9}/.match?(value)
                p "Wrong passport number: " + value
                return false
            end
        end
    }

    return true
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

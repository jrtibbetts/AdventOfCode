#!/usr/bin/env ruby

require 'Set'

@bags = { }

def bags_contained_by_color(color)
    contained_bags = @bags[color]

    if contained_bags == nil
        p "Creating a bag for " + color
        contained_bags = Set[]
        @bags[color] = contained_bags
    elsif !contained_bags.empty?
        p "Found an existing bag: " + contained_bags.to_s
    end

    return contained_bags
end

IO.readlines("7.input").each { | line |
    p line
    /(.*) bags contain (.*)./.match(line)
    
    bag_color = $1
    bags = bags_contained_by_color($1)

    $2.split(', ').each { | color_string |
        /\d* (.*) bag.*/.match(color_string)
        p "Adding '" + $1 + "' to bag '" + bag_color + "'"
        bags < bags_contained_by_color($1)
    }

    @bags[bag_color] = bags
    p
}

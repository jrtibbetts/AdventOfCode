#!/usr/bin/env ruby

require 'Set'

def bags_contained_by_color(color, bags)
    contained_bags = bags[color]

    if contained_bags == nil
        p "Creating a bag for " + color
        contained_bags = Set[color]
        bags[color] = contained_bags
    elsif !contained_bags.empty?
        p "Found an existing bag: " + contained_bags.to_s
    end

    return contained_bags
end

bags_by_color = { }

IO.readlines("7.input").each { | line |
    p line
    /(.*) bags contain (.*)./ =~ line
    
    bag_color = $1
    sub_bags = bags_contained_by_color($1, bags_by_color)

    $2.split(', ').each { | color_string |
        /\d* (.*) bag.*/ =~ color_string
        p "Adding '" + $1 + "' to bag '" + bag_color + "'"
        sub_bag = bags_contained_by_color($1, bags_by_color)
        sub_bags << sub_bag
    }

    p "Adding " + sub_bags.count.to_s + " bags to " + bag_color
    bags_by_color[bag_color] = sub_bags
    p "\n"
}

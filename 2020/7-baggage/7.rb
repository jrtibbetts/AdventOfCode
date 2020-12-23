#!/usr/bin/env ruby

require 'Set'

def bags_contained_by_color(color, bags)
    contained_bags = bags[color]

    if contained_bags == nil
        contained_bags = [color] # Set[color]
        bags[color] = contained_bags
     end

    return contained_bags
end

def number_of_bags_contained_by(color)
    sub_bags = @bags[color]

    if sub_bags.empty?
        return 0
    else
        return sub_bags.inject(0) { | sum, sub_bag_color_and_count |
            /(\d+) (.*)/ =~ sub_bag_color_and_count
            sum += $1.to_i # the sub-bag itself
            sum + ($1.to_i * number_of_bags_contained_by($2)) # the bags contained by the sub-bag
        }
    end
end

def print_bag(color_and_count, depth)
    /(\d+) (.*)/ =~ color_and_count

    padding = Array.new(depth * 2, " ")
    p padding.join + $1 + " " + $2 + " (x" + number_of_bags_contained_by($2).to_s + ")"

    @bags[$2].each { | sub_bag |
        print_bag(sub_bag, depth + 1)
    }
end

@bags_by_color = { }
@bags = { }

IO.readlines("7.input").each { | line |
    /(.*) bags contain (.*)./ =~ line
    
    bag_color = $1
    sub_bags = bags_contained_by_color($1, @bags_by_color)
    @bags[bag_color] = []

    $2.split(', ').each { | color_string |
        /(\d+) (.*) bag.*/ =~ color_string

        if $& != nil
            @bags[bag_color] << ($1 + " " + $2)

            sub_bag = bags_contained_by_color($2, @bags_by_color)
            sub_bags << sub_bag
        end
    }
}

gold_container_count = 0

@bags_by_color.each_value { | sub_bag |
    if sub_bag.flatten.include? "shiny gold"
        gold_container_count += 1
    end
}

p gold_container_count.to_s + " bags can contain shiny gold."
p "A shiny gold bag contains " + number_of_bags_contained_by("shiny gold").to_s

print_bag("1 shiny gold", 0)

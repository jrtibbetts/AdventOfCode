#!/usr/bin/env ruby

p "Arguments: " + ARGV.to_s
input_lines = IO.readlines ARGV[0]
input_numbers = input_lines.map(&:to_i).sort
p input_numbers
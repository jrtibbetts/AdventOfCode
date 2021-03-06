#!/usr/bin/env ruby

seat_ids = []

IO.readlines("5.input").each { | line |
    p line.chomp
    if /([BF]{7})([LR]{3})/ =~ line.chomp
        rows = $1
        p "Rows: " + rows
        row = rows.tr('FB', '01').to_i(2)
        seats = $2
        p "Seats: " + seats
        seat = seats.tr('LR', '01').to_i(2)
        seat_id = (row * 8) + seat
        p seat_id
        seat_ids << seat_id
    end
}

(seat_ids.min..seat_ids.max).to_a.each { | id |
    if !seat_ids.sort.include? id
        p "Missing seat ID: " + id.to_s
        break
    end
}

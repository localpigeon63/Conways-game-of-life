
field = [
    [0,0,0,0,0],
    [0,0,1,0,0],
    [0,0,1,0,0],
    [0,0,1,0,0],
    [0,0,0,0,0]
]

#method to find the value of a given item (i.e. dead or alive).
#passes field, row and column in (i.e. when called you need to specify the location in three ways). 
#dig is predefined method to find value at a given index, expecting to be fed x and y coordinates (named row, column here)
def cell_value(field, row, column)
    field.dig(row, column)
end

#finds the values of the item's neighbours in the grid.
#method name followed by the location of original item (i.e. whose neighbours) 
def neighbours(field, row, column)
    [field.dig(row-1, column-1),
    field.dig(row-1, column),
    field.dig(row-1, column+1),
    field.dig(row, column-1),
    field.dig(row, column+1),
    field.dig(row+1, column-1),
    field.dig(row+1, column),
    field.dig(row+1, column+1)]
end

#writing another method! to deal with the two-dimensional array in field (which is an array of arrays)
#need both each_with_index and map in l33 because there is no map_with_index
#the stuff in pipes gives names to the outputs of the each_with_index.map
#next line operates at the next level down (i.e. within one of the arrays in field), returning an item and its col value
#neighbours method is then run on the item, and live/dead neighbours are counted.
def next_life_stage(field)
    field.each_with_index.map do |row_array, row_index|
        row_array.each_with_index.map do |item, column_index|
        item_neighbours = neighbours(field, row_index, column_index)
            live_neighbours = item_neighbours.count(1)
#checks whether the current item is dead or alive (0 or 1), and then counts its live neighbours
#== || is notation for equals x or equals y. || is 'or', but needs a full expression on each side (can't say if equals 2||3, have to say if equals 2 || equals 3)
            if cell_value(field, row_index, column_index) == 1
        if live_neighbours == 2|| live_neighbours == 3
            1
        else
            0
        end
    else
        if live_neighbours == 3
            1
        else
            0
        end

    end
end
end.to_a
end

#method to display the field as /. rather than 10. Join the items within each array together with no joining character (the "").
#.join returns a string
#then join together the five strings into a single string, separated by newlines.
#and some gsubs to replace the characters
def render(field)
  field.map do|row|
    row.join("")
  end
.join("\n")
.gsub("1", "/")
.gsub("0", ".")
end

#runs the next block three times
#method(argument) syntax
3.times do 
field = next_life_stage(field)
puts render(field)
#adds a 0.5 second delay between each iteration
sleep 0.5
end


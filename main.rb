
field = [
    [0,0,0,0,0],
    [0,0,1,0,0],
    [0,0,1,0,0],
    [0,0,1,0,0],
    [0,0,0,0,0]
]

def cell_value(field, row, column)
    field.dig(row, column)
end

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

def next_life_stage(field)
    field.each_with_index.map do |row_array, row_index|
    row_array.each_with_index.map do |item, column_index|
    item_neighbours = neighbours(field, row_index, column_index)
        live_neighbours = item_neighbours.count(1)
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

3.times do 
    pp field
field = next_life_stage(field) 
sleep 2
end


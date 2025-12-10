input = File.readlines("./inputs/day05.txt")

ranges = []
fresh_ingredient_codes = []

input.each do |range|
    if range.include?("-")
        range_start = range.split("-")[0].to_i
        range_end = range.split("-")[1].chomp.to_i
        ranges << [range_start, range_end]
    end
end

sorted_ranges = ranges.sort
merged_ranges = []

def merge_ranges(range1, range2)
    if range1[0].between?(range2[0], range2[1]) || range2[0].between?(range1[0], range1[1])
        merged_start = [range1[0], range2[0]].min
        merged_end = [range1[1], range2[1]].max
        return [merged_start, merged_end]
    end
end

index = 0
while index < sorted_ranges.length
  current_range = sorted_ranges[index]
    next_range = sorted_ranges[index + 1]
    if next_range == nil
        merged_ranges << current_range
        break
    end
    if merge_ranges(current_range, next_range)
        merged = merge_ranges(current_range, next_range)
        sorted_ranges[index] = merged
        sorted_ranges.delete_at(index + 1)
    else
        merged_ranges << current_range
        index += 1
    end
end

total = 0
valid_numbers = []

merged_ranges.each do |merged_range|
    valid_numbers << merged_range[0]..merged_range[1]
    total += (merged_range[1] - merged_range[0]) + 1
end

puts total

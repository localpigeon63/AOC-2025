#input = "11-22,95-115,998-1012,1188511880-1188511890,222220-222224,1698522-1698528,446443-446449,38593856-38593862,565653-565659,824824821-824824827,2121212118-2121212124"

input = File.read("./inputs/day02.txt")

id_ranges = input.split(",")

invalid_ids = []

def generate_nums(range)
    start_end = range.split("-")
    start_end[0].to_i..start_end[1].to_i
end

id_ranges.each do |range|
    nums = generate_nums(range)
    nums.each do |num|
        num = num.to_s
        if num[0, num.length/2] == num[num.length/2, num.length]
            invalid_ids << num.to_i
        end
    end
end

puts invalid_ids.sum
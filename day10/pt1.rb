input = File.readlines("./inputs/day10.txt")

def parse(line)
  line = line.chomp.strip
  diagram = line[/\[(.*?)\]/, 1]
  buttons = line.scan(/\((.*?)\)/).map do |button_array|
  button_array[0].split(",").map(&:to_i)
end
  [diagram, buttons]
end

def toggle(char)
    case char
    when "."
        "#"
    when "#"
        "."
    end
end

def generate_button_combinations(button_array, combination_length, diagram)
    max_valid_number = diagram.length-1
    valid_buttons = []
    button_array.each do |button|
        if button.any? { |n| n <= max_valid_number }
        valid_buttons << button
        end
    end
    valid_buttons.repeated_permutation(combination_length)
end    

button_presses = 0

input.each do |line|
    diagram, buttons = parse(line)
    combination_length = 1
    found = false
    loop do
        button_combinations = generate_button_combinations(buttons, combination_length, diagram).to_a
        button_combinations.each do |combination|
            lights = Array.new(diagram.length, ".")
            combination.each do |button|
                button.each do |element|
                    next if element >= lights.size
                    lights[element] = toggle(lights[element])
                end
            end
            if lights.join == diagram
                button_presses += combination_length
                found = true
                break
            end
        end
        break if found == true
        combination_length += 1
    end
end

puts button_presses 
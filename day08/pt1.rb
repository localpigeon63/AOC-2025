input= File.readlines("./inputs/day08.txt")

Vector = Data.define(:x, :y, :z)

def find_distance(a, b)
    x2 = b.x - a.x
    y2 = b.y - a.y
    z2 = b.z - a.z
    Math.sqrt(x2 ** 2 + y2 ** 2 + z2 ** 2)
end

vectors = input.map do |line|
    a, b, c = line.chomp.split(",").map {|num| num.to_i}
    Vector.new(a,b,c)
end

distances = {}

# all but last
vectors[..-2].each_with_index do |vector1, index|
    # from the next one until the end
    vectors[index+1..].each do |vector2|
        distances[[vector1, vector2]] = find_distance(vector1, vector2)
    end
end

sorted_distances = distances.sort_by { |_, value| value }.to_h

circuits = []

sorted_distances.first(1000).each do |boxes, distance|
    box_0_circuit = nil
    box_1_circuit = nil
    circuits.each_with_index do |circuit, index|
        if circuit.include?(boxes[0])
            box_0_circuit = index
        end
        if circuit.include?(boxes[1])
            box_1_circuit = index
        end
    end

    box_0_disconnected = box_0_circuit.nil?
    box_1_disconnected = box_1_circuit.nil?
    box_0_has_circuit = !box_0_circuit.nil?
    box_1_has_circuit = !box_1_circuit.nil?

    if box_0_disconnected && box_1_disconnected
        circuits << [boxes[0], boxes[1]]
    elsif box_0_has_circuit && box_1_disconnected
        circuits[box_0_circuit] << boxes[1]
    elsif box_0_disconnected && box_1_has_circuit
        circuits[box_1_circuit] << boxes[0]
    elsif box_0_circuit == box_1_circuit && box_0_has_circuit
        next
    elsif box_0_has_circuit && box_1_has_circuit && box_0_circuit != box_1_circuit
        merge(box_0_circuit, box_1_circuit, circuits)
    end
end

def merge(index1, index2, circuits)
     combined_circuit = circuits[index1] + circuits[index2]
    [index1, index2].sort.reverse.each do |index|
            circuits.delete_at(index)
    end
    circuits << combined_circuit
end

circuits.sort_by!{ |circuit| circuit.length }.reverse!

puts "Part one answer: #{circuits[0].length * circuits[1].length * circuits[2].length}"






class Array
 def merge_sort(&prc)
   return self if count <= 1
   prc ||= Proc.new { |x, y| x <=> y}

   mid = self.length / 2
   sorted_left = self.take(mid).merge_sort(&prc)
   sorted_right = self.drop(mid).merge_sort(&prc)

   Array.merge(sorted_left, sorted_right, &prc)
 end

  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end

    merged.concat(left)
    merged.concat(right)

    merged
  end

 end

 def linear_search(fishes)
   max_fish = fishes.first
   fishes.each do |fish|
     if fish.length > max_fish.length
       max_fish = fish
     end
   end

   max_fish
 end

 def quadratic_search(fishes)
   fishes.each_with_index do |fish1, i|
     max_length = true

     fishes.each_with_index do |fish2, j|
       next if i == j
       max_length = false if fish2.length > fish1.length
     end

     return fish1 if max_length
   end

 end

def slow_dance(dir, tiles_array)
  tiles_array.each_with_index do |tile, index|
    return index if tile == dir
  end
end

def fast_dance(dir, tiles_array)
  all_fishes = {}
  tiles_array.each_with_index do |tile, i|
    all_fishes[tile] = i
  end

  all_fishes[dir]
end


# fishes = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
# puts linear_search(fishes)
# p fishes.merge_sort

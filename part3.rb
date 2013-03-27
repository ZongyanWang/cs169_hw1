def combine_anagrams(words)
 # YOUR CODE HERE
 anagrams = Hash.new(0)
 words.each do |word|
   key = word.downcase.chars.sort.join
    anagrams[key] = Array.new(0) unless anagrams.has_key?(key)
    anagrams[key].push(word)
 end
 anagrams.values
end

combine_anagrams(['Cars', 'for', 'potatoes', 'racs', 'four', 'scar', 'creams', 'scream'])

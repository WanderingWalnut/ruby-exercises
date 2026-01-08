def substrings(input_string, dictionary)
  # Split the string based on spaces
  # Filter for words only using regex, if it doesn't match replace with ""
  # Any array slots that are left as [""] we delete with reject
  # &:empty? means run this boolean method on all elements in the array
  cleaned_string = input_string.split(" ").map { |word| word.gsub(/[^A-Za-z]/, "") }.reject(&:empty?)
  puts "Cleaned String: #{cleaned_string}"

  res = Hash.new(0)

  # Iterate over each word in our cleaned string
  cleaned_string.each do |word|
    puts "Iterating on #{word}"
    # Check all substrings within our dict for that word
    dictionary.each do |substring|
      # If it is a valid substring increment count for dict
      if word.downcase.include?(substring.downcase)
        puts "#{substring} is part of #{word}"
        res[substring] += 1
      end
    end
  end
  res
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
res = substrings("Howdy partner, sit down! How's it going?", dictionary)
puts res


def caesar_cipher(input_string, shift_factor)

  res = ""

  input_string.each_char do |char|
    # If char is an alphabet, shift
    if char.match?(/[[:alpha:]]/)
      char_ord = char.ord
      p "Char #{char} has #{char_ord}"
      
      # If char is uppercase then our range is 65-90 for ord
      if char_ord.between?(65,90)
        # Normalize
        char_ord -= 65
        # Handle wrap around
        char_ord = (char_ord+shift_factor) % 26
        # Return to old ord
        char_ord += 65
      
      # Lowercase char is in the range of 97-122
      elsif char_ord.between?(97,122)
        # Normalize
        char_ord -= 97
        # Handle wrap around
        char_ord = (char_ord+shift_factor) % 26
        # Return to old ord
        char_ord += 97

      else
        return "Unkown error has occured"
      end

      shifted_char = char_ord.chr
      
      p "Ord is now #{char_ord} and adding #{shifted_char} to res"
      res << shifted_char
    
    else
      res << char
    end
  end
  return res
end

def main
  puts "Program has started"
  puts "Please input your input string"
  input_string = gets.chomp

  if input_string.empty?
    puts "Input string is empty"
    return
  end

  puts "Please input your shift factor"
  shift_factor = gets.chomp.to_i

  p input_string, shift_factor
  # Check if shift_factor is an int
  if shift_factor == 0
    puts "Input a valid shift factor"
    return
  end

  res = caesar_cipher(input_string, shift_factor)
  p res
  return res

end

main if __FILE__ == $0
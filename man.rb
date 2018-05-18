
# Menu
def menu
  puts "===================================="
  puts "MAIN MENU"
  puts "===================================="

  menu_items = ["1. Command Line", "2. Search", "3. Exit"]

  puts menu_items
  @menu_decision = gets.chomp.to_i
end

# Stuffs from the first menu
until @menu_decision == 3
  case @menu_decision
    when 1
      puts "Select an option to see an output"
      puts "1. mv"
      puts "2. cp"
      puts "3. mkdir"
      puts "4. ls"
      puts "5. rm"
      @cmd_decision = gets.chomp.to_i

      # Stuffs from the second menu
      case @cmd_decision
        when 1
          output = `man mv`
          puts output
          puts menu
        when 2
          output = `man cp`
          puts output
          puts menu
        when 3
          output = `man mkdir`
          puts output
          puts menu
        when 4
          output = `man ls`
          puts output
          puts menu
        when 5
          output = `man rm`
          puts output
          puts menu
        else 
          puts "Sorry, try again"
          puts menu
      end
      
    when 2
      puts "Enter your term"
      output = gets.strip
      puts `man #{output}`
      puts menu
    else
      puts "Try again"
      puts menu
    end
end 

# I'm having some trouble with the indenting, not sure if the "when" has to be indented
# if yes then how do I make vscode stop "when" from indenting
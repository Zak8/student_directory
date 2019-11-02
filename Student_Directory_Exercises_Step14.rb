require "CSV"

@students = [] # an empty array accessible to all methods

@the_file_name = ""

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list"
  puts "4. Load the list"
  puts "9. Exit" # 9 because we'll be adding more items
end

def try_load_students
  filename = ARGV.first# first argument from the command line
  if filename.nil? # get out of the method if it isn't given
    filename = "students.csv"
  end
  if File.exists?(filename) # if it exists
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end


def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "9"
    exit # this will cause the program to terminate
  when "3"
    save_students
  when "4"
    load_students
  else
    puts "I don't know what you meant, try again"
  end
end

def add_student(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def input_students
  puts "This is the input option."
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    puts "You enter #{name}."
    # add the student hash to the array
    add_student(name, :november)
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = STDIN.gets.chomp
  end
end

def show_students
  puts "This is the show students option."
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  # open the file for writing
  puts "This is the saving option, enter a file name to save."
  puts "What file name?"
  @the_file_name = gets.chomp
  CSV.open(@the_file_name, "wb") do |csv|
    # ...
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv << student_data
    end
  end
  # iterate over the array of students
  puts "Students have"
end

def load_students(filename = nil)
  if filename.nil?
    puts "This is the loading option, enter a file name to load."
    puts "What file name?"
    @the_file_name = gets.chomp
  else
    @the_file_name = filename
  end
  CSV.foreach(@the_file_name) do |row|
    # use row here...
    name, cohort = row
    @students << {name: name, cohort: cohort}
  end
end

try_load_students
interactive_menu

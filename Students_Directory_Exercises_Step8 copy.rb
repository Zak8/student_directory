def input_students
  puts "Please enter the names of the students and cohort values."
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.sub("\n", "")
  # while the name is not empty, repeat this code
  cohort = gets.sub("\n", "")
  while !name.empty? do
    # add the student hash to the array
    months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December", ""]
    until months.include?(cohort)
      puts "You made a typo try again?"
      cohort = gets.sub("\n", "")
    end
    if cohort === ""
      cohort = :November
    end
    students << {name: name, cohort: cohort, hobbies: :cycling, country_of_birth: :england}
    if students.count === 1
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end
    # get another name from the user
    name = gets.sub("\n", "")
    cohort = gets.sub("\n", "")
  end
  # return the array of students
  students
end

# def print_header
#   puts "The students of Villains Academy"
#   puts "-------------"
# end

def print(students)
  the_string = ""
  theArray = []
  # if students.length > 0
  #   students.each do |student|
  #     theArray.push("#{student[:name]} (#{student[:cohort]} cohort) #{student[:hobbies]} #{student[:country_of_birth]}")
  #     # .center(25)
  #   end
  # end
    counter = 0
    while counter < students.length
      the_string += "#{students[counter][:name]} (#{students[counter][:cohort]} cohort) #{students[counter][:hobbies]} #{students[counter][:country_of_birth]} \n"
      # theArray.each do |student|
      #   puts "#{student[counter][:name]} (#{student[counter][:cohort]} cohort) #{student[counter][:hobbies]} #{student[counter][:country_of_birth]}"
      # end
      # students.each do |student|
      #   theArray.push("#{student[:name]} (#{student[:cohort]} cohort) #{student[:hobbies]} #{student[:country_of_birth]}")
      # end
      counter += 1
    end
    the_string
    # theArray.sort!
  # end
end
  # while students
  # students.each_with_index do |student, index|
  #   if student[:name][0] === "b" and student[:name].length < 12
  #     puts "#{index} (#{student[:name]})"
  #   end
  # end

def print_footer(students)
    if students.length === 0
      puts ""
    elsif students.length === 1
      puts "Overall, we have #{students.count} great student".center(25)
    else
      puts "Overall, we have #{students.count} great students"
    end
end

students = input_students
#nothing happens until we call the methods
# print_header
puts print(students)
print_footer(students)
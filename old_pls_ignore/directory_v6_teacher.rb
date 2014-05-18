def print_header
  print "The students of my cohort at Makers Academy\n"
  print "-------------\n"
end

def print_students(students)
  students.each_with_index do |student, index|
    print "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)\n"
  end
end

def print_footer(names)    
  puts "Overall, we have #{names.length} great students"
end

def input_students
  print "Please enter the names of the students\n"
  print "To finish, just hit return twice\n"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do    
    # add the student hash to the array
    students << {:name => name, :cohort => :november}

    students.keep_if { |hash| 
      hash[:name][0] === "A"
    }

    students.keep_if { |hash| 
      hash[:name].length < 12
    }

    print "Now we have #{students.length} students\n"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

students = input_students
print_header
print_students(students)
print_footer(students)
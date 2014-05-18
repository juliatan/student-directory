require 'date'

students = [
	{:name => "Julia", :cohort => :november},
	{:name => "Andy", :cohort => :december},
	{:name => "John", :cohort => :january},
	{:name => "Sally", :cohort => :february},
	{:name => "James", :cohort => :february},
	{:name => "Peter", :cohort => :november},
	{:name => "James", :cohort => :april},
	{:name => "James", :cohort => :march},
	{:name => "James", :cohort => :february},
	{:name => "ASDF", :cohort => :november}
]

# students.keep_if { |hash| 
# 	hash[:name][0] === "A"
# }

# students.each { |hash| 
# if hash[:name].start_with?("A")
# 	puts "YES"
# else
# 	puts "november"
# end
# }

# students.keep_if { |hash| 
# 	hash[:name].length < 12
# }

# using while loop
# puts "#{students.length}"

# i = 1

# while i <= students.length
# 	puts "Current number is #{i}"
# 	i += 1
# end

cohort_months = []

students.each do |student|
	cohort_months.push student[:cohort]
end


def cohort_choice(students, month)
	students.map do |student|
		puts student if student[:cohort] == month
	end
end

cohort_months.uniq.each do |month |
	cohort_choice(students, month)
end

# cohort_choice(students, :january)
# cohort_choice(students, :may)
# cohort_choice(students, :november)

# code for only printing student's names that start with A and less than 12 letters long
# def print
# 		@students.each_with_index do |student, index|
# 		puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)" if student[:name].start_with?("A") && student[:name].length < 12
# 	end
# end

# code for printing using while loop
# def print
# 	i = 0
# 	while i < @students.length
# 		puts "#{i+1}. #{@students[i][:name]} (#{@students[i][:cohort]} cohort)" 
# 		i += 1
# 	end
# end

# code for printing using until loop
	# def print_students_list
	# i = 0
	# until i == @students.length
	# 	puts "#{i+1}. #{@students[i][:name]} (#{@students[i][:cohort]} cohort) ** Hobbies: #{@students[i][:hobbies]}, Country of Birth: #{@students[i][:country]}, Height: #{@students[i][:height]}".center(150) 
	# 	i += 1
	# end	

# define save methodology - refectored to use code blocks
# def save_students
# 	File.open("students.csv", "w") #open the file for writing
# 	@students.each do |student|
# 		student_data = [student[:name], student[:cohort]]
# 		csv_line = student_data.join(",")
# 		puts csv_line
# 	end
# 	puts "File saved"
# end

# def save_students
# 	# open the file for writing
# 	file = File.open("students.csv", "w")
# 	# iterate over the array of students
# 	@students.each do |student|
# 		student_data = [student[:name], student[:cohort]]
# 		csv_line = student_data.join(",")
# 		file.puts csv_line
# 	end
# 	file.close
# 	puts "File saved"
# end

# define load methodology - refactored using code block
# def load_students(filename = "students.csv")
# 	File.open(filename, "r") do |file|
# 		file.readlines.each do |line|
# 			name, cohort = line.chomp.split(",")
# 			push_student(name, cohort)
# 		end
# 	end
# 	puts "It's been loaded"
# end

# def load_students(filename = "students.csv")
# 	file = File.open(filename, "r")
# 	file.readlines.each do |line|
# 		name, cohort = line.chomp.split(",")
# 		push_student(name, cohort)
# 		# @students << {name: name, cohort: cohort.to_sym}
# 	end
# 	file.close
# 	puts "It's been loaded"
# end

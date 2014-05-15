# let's put all students into an array
=begin
students = [
	{name: "Roi Driscoll", cohort: :may},
	{name: "James Whyte", cohort: :may},
	{name: "Margherita Serino", cohort: :may},
	{name: "Vaidas Mykolaitis", cohort: :may},
	{name: "Johann Bornman", cohort: :may},
	{name: "Kate Hamilton", cohort: :may},
	{name: "James Keap", cohort: :may},
	{name: "Nic Yeeles", cohort: :may},
	{name: "Julie Walker", cohort: :may},
	{name: "Will Allen", cohort: :may},
	{name: "Julia Tan", cohort: :may},
	{name: "Federico Maffei", cohort: :may},
	{name: "Jamie Patel", cohort: :may},
	{name: "Faezrah Rizalman", cohort: :may},
	{name: "Josh Fail-Broon", cohort: :may},
	{name: "Sasha Cooper", cohort: :may},
	{name: "Nicolai DTH", cohort: :may},
	{name: "Nadav Matalon", cohort: :may},
	{name: "Fitsum Teklehaimanot", cohort: :may}
]
=end

# define a variable accessible to all methods
require 'date'

@students = []

def interactive_menu
	# 4. repeat from step 1
	loop do
		# 1. print the menu and ask the user what to do
		print_menu
		# 2. read the input and save it to a variable
		process(gets.chomp)
	end
end

		# 3. do what the user has asked
def process(selection)
	case selection
	when "1"
		 input_students 
	when "2"
		show_students
	when "3"
		save_students
	when "4"
		load_students
	when "9"
		exit #this will cause the program to terminate
	else
		puts "I don't know what you meant, try again"
	end
end

def print_menu
	puts "1. Input the students"
	puts "2. Show the students"
	puts "3. Save the list to students.csv"
	puts "4. Load the list from students.csv"
	puts "9. Exit"
end

# Option 1
def input_students
	puts "Please enter the names of the students"
	puts "To finish, just hit return twice"
	name = gets.chomp

	puts "What are this person's hobbies?"
	hobbies = gets.chomp
	
	puts "Where is this person from?"
	country = gets.chomp

	puts "What is this person's height?"
	height = gets.chomp

	while !name.empty? do 

		puts "Which cohort do they belong to?"
		cohort = gets.chomp
		while !(Date::MONTHNAMES).include? cohort.capitalize do
			puts "Did you get the month right? Reenter: "
			cohort = gets.chomp
		end

		cohort = :May if cohort == ""
		cohort = cohort.to_sym

		@students << {name: name, cohort: cohort, hobbies: hobbies, country: country, height: height}

		# @students.keep_if { |hash| 
	 #      hash[:name][0] === "A"
	 #    }

	    # @students.keep_if { |hash| 
	    #   hash[:name].length < 12
	    # }

		puts "Now we have #{@students.length} students\nAny more students?\n"

		name = gets.chomp

		if !name.empty?
			puts "Which cohort do they belong to?"
			cohort = gets.chomp

			puts "What are this person's hobbies?"
			hobbies = gets.chomp
		
			puts "Where is this person from?"
			country = gets.chomp

			puts "What is this person's height?"
			height = gets.chomp
		end
	end
end

# Option 2

def show_students
	print_header
	print_students_list
	print_footer
end

def print_header
	puts "The students of my cohort at Makers Academy"
	puts "-----------------------------"
end

# code for only printing student's names that start with A and less than 12 letters long
# def print
# 		@students.each_with_index do |student, index|
# 		puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)" if student[:name].start_with?("A") && student[:name].length < 12
# 	end
# end

# code for printing using while
# def print
# 	i = 0
# 	while i < @students.length
# 		puts "#{i+1}. #{@students[i][:name]} (#{@students[i][:cohort]} cohort)" 
# 		i += 1
# 	end
# end

# code for printing using until
def print_students_list
	i = 0
	until i == @students.length
		puts "#{i+1}. #{@students[i][:name]} (#{@students[i][:cohort]} cohort) ** Hobbies: #{@students[i][:hobbies]}, Country of Birth: #{@students[i][:country]}, Height: #{@students[i][:height]}".center(150) 
		i += 1
	end
end

def print_footer
	puts "\nOverall, we have #{@students.length} great students\n"
end

# define save methodology

def save_students
	# open the file for writing
	file = File.open("students.csv", "w")
	# iterate over the array of students
	@students.each do |student|
		student_data = [student[:name], student[:cohort]]
		csv_line = student_data.join(", ")
		file.puts csv_line
	end
	file.close
end

def load_students
	file = File.open("students.csv", "r")
	file.readlines.each do |line|
		name, cohort = line.chomp.split(",")
		@students << {name: name, cohort: cohort.to_sym}
	end
	file.close
	puts "It's been loaded"
end


interactive_menu
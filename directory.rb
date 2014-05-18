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

# to check that cohort input is valid
require 'date'

# for working with CSV files
require 'csv'

# define a variable accessible to all methods
@students = []

def interactive_menu
	loop do
		print_menu
		puts "\n"
		process(STDIN.gets.chomp) # can replace with process(gets.gsub("\n", ""))
	end
end

def process(selection)
	case selection
	when "1"
		 input_students 
	when "2"
		
		@cohort_months = []
		@students.each do |student|
			@cohort_months.push student[:cohort]
		end

		if @students.length == 0
			puts "You haven't entered anything!"
		else
			show_students	
		end

	when "3"
		print "What filename do you want to save to? "
		@filename_save = STDIN.gets.chomp
		save_students

	when "4"
		print "What filename do you want to load? "
		@filename_load = STDIN.gets.chomp
		load_students

	when "9"
		exit #this will cause the program to terminate
	else
		puts "I don't know what you meant, try again"
	end
end

def print_menu
	puts "\n1. Input the students"
	puts "2. Show the students"
	puts "3. Save the list to a filename of your choice"
	puts "4. Load the list from a filename of your choice"
	puts "9. Exit\n"
end

# Option 1
def input_students
	puts "\nPlease enter the names of the students"
	puts "To finish, just hit return twice"
	puts "\n"
	name = STDIN.gets.chomp

	while !name.empty? do 

		puts "Which cohort do they belong to?"
		cohort = STDIN.gets.chomp
		while !(Date::MONTHNAMES).include? cohort.capitalize do
			puts "Did you get the month right? Reenter: "
			cohort = STDIN.gets.chomp
		end

		cohort = :May if cohort == ""
		# cohort = cohort.to_sym

		push_student(name, cohort)
		# @students << {name: name, cohort: cohort}

	 	puts "Now we have #{@students.length} #{pluralisation}\nAny more students?\n"

		name = STDIN.gets.chomp

		# if !name.empty?
		# 	puts "Which cohort do they belong to?"
		# 	cohort = gets.chomp
		# end
	end
end

# Option 2
def show_students
	print_header
	print_students_list
	print_footer
end

def pluralisation
	if @students.length == 1
		"student"
	else
		"students"
	end
end

def print_header
	puts "\nThe #{pluralisation} at Makers Academy"
	puts "-----------------------------"
end

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
	
def print_students_list
	@cohort_months.uniq.each do | month |
		cohort_choice(@students, month)
		puts "\n"
	end
end

def cohort_choice(students, month)
	by_cohort = students.select { |student| 
		student[:cohort] == month
	}

	by_cohort.each_with_index do |student, index|
		puts "#{index + 1}. - #{student[:name]} in #{student[:cohort]}"
	end
end

def print_footer
	puts "Overall, we have #{@students.length} great #{pluralisation}\n"
end

#define save methodology using CSV
def save_students
	CSV.open(@filename_save, "w") do |line|
		@students.each do |student|
			line << [student[:name], student[:cohort]]
		end
	end
	puts "File saved. What's next?"
end


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

#define load methodology using CSV library
def load_students(filename = @filename_load)
	@students.clear
	CSV.foreach(filename) do |line|
		name, cohort = line[0], line[1]
		push_student(name, cohort)
	end
	puts "Your file has been loaded. Press 2 to view or choose another option."
end


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

def try_load_students
	filename = ARGV.first #first argument from command line
	return if filename.nil? #get out of the method if it isn't given
	if File.exists?(filename) # if it exists
		load_students(filename)
		puts "Loaded #{@students.length} from #{filename}"
	else
		puts "Sorry, #{filename} doesn't exist."
		exit
	end
end

def push_student(name, cohort)
	@students << {name: name, cohort: cohort.to_sym}
end

try_load_students
interactive_menu
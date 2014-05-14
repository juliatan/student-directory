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
	puts "9. Exit"
end

# Option 1
def input_students
	puts "Please enter the names of the students"
	puts "To finish, just hit return twice"
	name = gets.chomp
	
	while !name.empty? do 
		@students << {name: name, cohort: :may}
		puts "Now we have #{@students.length} students"
		name = gets.chomp
	end
end

# Option 2

def show_students
	print_header
	print
	print_footer
end

def print_header
	puts "The students of my cohort at Makers Academy"
	puts "-----------------------------"
end

def print
		@students.each do |student|
		puts "#{student[:name]} (#{student[:cohort]} cohort)"
	end
end

def print_footer
	puts "Overall, we have #{@students.length} great students"
end

# define save methodology

def save_students
	# open the file for writing
	file = File.open("students.csv", "a+")
	# iterate over the array of students
	@students.each do |student|
		student_data = [student[:name], student[:cohort]]
		csv_line = student_data.join(", ")
		file.puts csv_line
	end
	file.close
end

interactive_menu

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

# and then prints them

# code to get user input
def input_students
	puts "Please enter the names of the students"
	puts "To finish, just hit return twice"
	students = []
	name = gets.chomp
	
	while !name.empty? do 
		students << {name: name, cohort: :may}
		puts "Now we have #{students.length} students"
		name = gets.chomp
	end

	# return the array of students
	students
end

def print_header
	puts "The students of my cohort at Makers Academy"
	puts "-----------------------------"
end

def print(students)
		students.each do |student|
		puts "#{student[:name]} (#{student[:cohort]} cohort)"
	end
end

def print_footer(names)
	puts "Overall, we have #{names.length} great students"
end

# nothing happens until we call the methods
students = input_students 
print_header
print(students)
print_footer(students)

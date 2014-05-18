require 'date' # to validate month inputs
require 'csv' # for working with CSV files

@students = [] # define a variable accessible to all methods

def interactive_menu
	loop do
		print_menu
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
	puts "9. Exit\n\n"
end

def input_students
	puts "\nPlease enter the names of the students"
	puts "To finish, just hit return twice\n"
	name = STDIN.gets.chomp

	while !name.empty? do 

		puts "\nWhich cohort do they belong to?"
		cohort = STDIN.gets.chomp
		while !(Date::MONTHNAMES).include? cohort.capitalize do
			puts "Did you get the month right? Please check and re-enter: "
			cohort = STDIN.gets.chomp
		end

		cohort = :May if cohort == "" # default cohort if none entered
		push_student(name, cohort) # method pushes new data to array
	 	puts "\nNow we have #{@students.length} #{pluralisation}\nAny more students?\n"
		name = STDIN.gets.chomp
	end
end

def pluralisation
	@students.length == 1 ? "student": "students"
end

def show_students
	print_header
	print_students_list
	print_footer
end

def print_header
	puts "\nThe amazingly awesome #{pluralisation} at Makers Academy"
	puts "-----------------------------"
end
	
def print_students_list
	@cohort_months.uniq.each do | month | # prints student lists by cohort
		cohort_choice(@students, month)
		puts "\n"
	end
end

def cohort_choice(students, month) # students is the array
	by_cohort = students.select do |student| # only select students by month
		student[:cohort] == month
	end

	by_cohort.each_with_index do |student, index| # print out above results with index
		puts "#{index + 1}. - #{student[:name]} in #{student[:cohort]}"
	end
end

def print_footer
	puts "Overall, we have #{@students.length} great #{pluralisation}!\n"
end

def save_students
	CSV.open(@filename_save, "w") do |line|
		@students.each do |student|
			line << [student[:name], student[:cohort]]
		end
	end
	puts "#{@filename_save} file saved. What's next?"
end

def load_students(filename = @filename_load)
	@students.clear # ensures old student list from previous file cleared
	CSV.foreach(filename) do |line|
		name, cohort = line[0], line[1]
		push_student(name, cohort)
	end
	puts "The #{@filename_load} file has been loaded. Press 2 to view or choose another option."
end

def try_load_students
	filename = ARGV.first # first argument from command line
	return if filename.nil? # get out of the method if it isn't given
	if File.exists?(filename)
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
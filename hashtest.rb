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

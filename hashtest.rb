students = [
	{:name => "Julia", :cohort => :november},
	{:name => "Andy", :cohort => :november},
	{:name => "John", :cohort => :november},
	{:name => "Sally", :cohort => :november},
	{:name => "Peter", :cohort => :november},
	{:name => "ASDFADSFADFADAFDAFAFAFAFDFDAF", :cohort => :november}
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

puts "#{students.length}"

i = 1

while i <= students.length
	puts "Current number is #{i}"
	i += 1
end
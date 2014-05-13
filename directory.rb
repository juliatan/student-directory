# let's put all students into an array
students = [
	"Roi Driscoll",
	"James Whyte",
	"Margherita Serino",
	"Vaidas Mykolaitis",
	"Johann Bornman",
	"Kate Hamilton",
	"James Keap",
	"Nic Yeeles",
	"Julie Walker",
	"Will Allen",
	"Julia Tan",
	"Federico Maffei",
	"Jamie Patel",
	"Faezrah Rizalman",
	"Josh Fail-Broon",
	"Sasha Cooper",
	"Nicolai DTH",
	"Nadav Matalon",
	"Fitsum Teklehaimanot"
]

# and then prints them
puts "The students of my cohort at Makers Academy"
puts "-----------------------------"

students.each do |student|
	puts student
end

# finally we print the total
print "Overall, we have #{students.length} great students"



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

def print_header
	puts "The students of my cohort at Makers Academy"
	puts "-----------------------------"
end

def print(names)
	names.each do |name|
	puts name
end

def print_footer(names)
	puts "Overall, we have #{names.length} great students"
end

# nothing happens until we call the methods
print_header
print(students)
print_footer(students)



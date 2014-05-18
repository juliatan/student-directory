title = ARGV.first

File.open(title) do |file| 
  puts "Here is your file: #{title}\n\n"
  puts file.read()
end
require "csv"

contents=CSV.open("event_attendees.csv",{:headers=>true, :header_converters=> :symbol})

def clean_zipcode(zip)
	if zip.nil?
		"00000"
	elsif zip.length<5
		zip.rjust(5,"0")
	else
		zip[0...5]
	end
end

counter=0
contents.each do |row|
	puts "#{row[:first_name]} #{clean_zipcode(row[:zipcode])}"
end


def input_students
  students = []
  puts "Enter name of student you would like to add".center(72)
  name = gets.chomp.capitalize
  while !name.empty? do
    while true do
    puts "What cohort is #{name} in? If #{name} does not have one yet, just press return...".center(72)
    cohort = gets.chomp.capitalize
    if cohort == nil
      cohort = "N/A"
      break
    elsif cohort == "January" || cohort == "Febuary" || cohort == "March" ||
      cohort == "April" || cohort == "May" || cohort == "June" ||
      cohort == "July" || cohort == "August" || cohort == "September" ||
      cohort == "October" || cohort == "November" || cohort == "December"
      break
    end
  end
    puts "What is #{name}'s favourite hobbie?".center(72)
    hobbie = gets.chomp.capitalize
    puts "What is #{name}'s date of birth?".center(72)
    dob = gets.chomp.capitalize
    puts "What is #{name}'s height?".center(72)
    height = gets.chomp.capitalize
    students << {name: name.to_sym, cohort: cohort.to_sym,
    hobbie: hobbie.to_sym, date_of_birth: dob.to_sym, height: height.to_sym}
    puts "Now we have #{students.count} students".center(72)
    puts "If you have finished, just hit return twice".center(72)
    puts "Enter another students name".center(72)
    name = gets.chomp.capitalize
  end
  students
end

def print_header
  puts "The students of Villains Academy".center(72)
  puts "-------------".center(72)
end
def print(students)
  count = students.length
  until count == 0 do
    students.each.with_index(1) do |student, index|
      if student[:name].length < 12
        puts "#{index}. #{student[:name]} (#{student[:cohort]} Cohort, #{student[:hobbie]} Hobbie, #{student[:date_of_birth]} DOB, #{student[:height]} Height)".center(72)
        count -= 1
      end
    end
  end
end
def print_footer(names)
  puts "Overall, we have #{names.count} great students".center(72)
end
students = input_students
print_header
print(students)
print_footer(students)

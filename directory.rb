def input_students
  students = []
  puts "Enter name of student you would like to add".center(72)
  name = gets.chomp.capitalize
  while !name.empty? do
    puts "What is #{name}'s favourite hobbie?".center(72)
    hobbie = gets.chomp.capitalize
    puts "What is #{name}'s date of birth?".center(72)
    dob = gets.chomp.capitalize
    puts "What is #{name}'s height?".center(72)
    height = gets.chomp.capitalize
    students << {name: name, cohort: :November, hobbie: hobbie, date_of_birth: dob,
    height: height}
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

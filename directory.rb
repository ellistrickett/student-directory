def input_students
  students = []
  puts "Enter name of student you would like to add"
  name = gets.chomp.capitalize
  while !name.empty? do
    puts "What is #{name}'s favourite hobbie?"
    hobbie = gets.chomp.capitalize
    puts "What is #{name}'s date of birth?"
    dob = gets.chomp.capitalize
    puts "What is #{name}'s height?"
    height = gets.chomp.capitalize
    students << {name: name, cohort: :November, hobbie: hobbie, date_of_birth: dob,
    height: height}
    puts "Now we have #{students.count} students"
    puts "If you have finished, just hit return twice"
    puts "Enter another students name"
    name = gets.chomp.capitalize
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end
def print(students)
  count = students.length
  until count == 0 do
    students.each.with_index(1) do |student, index|
      if student[:name].length < 12
        puts "#{index} #{student[:name]} (#{student[:cohort]} Cohort, #{student[:hobbie]} Hobbie,
        #{student[:date_of_birth]} DOB, #{student[:height]} Height)"
        count -= 1
      end
    end
  end
end
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end
students = input_students
print_header
print(students)
print_footer(students)

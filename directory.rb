@students =  []

def load_student
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
  name, cohort, hobbie, date_of_birth, height = line.chomp.split(',')
    @students << {name: name, cohort: cohort, hobbie: hobbie, date_of_birth: date_of_birth, height: height}
  end
  file.close
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:hobbie], student[:date_of_birth], student[:height]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_student
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
    end
  end

def show_students
  if @students.length > 0
    print_header
    print_students_list
    print_footer
  else
    my_puts "There is currently no students at Villains Academy"
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def my_puts(str)
  puts str.center(72)
end

def input_students
  my_puts "Enter name of student you would like to add"
  name = gets.tr("\n\r", "").capitalize
  while !name.empty? do
    while true do
    my_puts "What cohort is #{name} in? If #{name} does not have one yet, just press return..."
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
    my_puts "What is #{name}'s favourite hobbie?"
    hobbie = gets.chomp.capitalize
    my_puts "What is #{name}'s date of birth?"
    dob = gets.chomp.capitalize
    my_puts "What is #{name}'s height?"
    height = gets.chomp.capitalize
    @students << {name: name.to_sym, cohort: cohort.to_sym,
    hobbie: hobbie.to_sym, date_of_birth: dob.to_sym, height: height.to_sym}
    if @students.count == 1
      my_puts "Now we have 1 student"
    else
      my_puts "Now we have #{@students.count} students"
    end
    my_puts "If you have finished, just hit return twice"
    my_puts "Enter another students name"
    name = gets.chomp.capitalize
  end
  @students
end

def print_header
  my_puts "The students of Villains Academy"
  my_puts "-------------"
end
def print_students_list
  cohorts = []
  @students.each {|student| cohorts.push(student[:cohort])}
  cohorts.uniq.each do |cohort|
  my_puts "Cohort: #{cohort}"
  @students.map.with_index(1) do |student, index|
    my_puts "#{index}. #{student[:name]} (#{student[:hobbie]} Hobbie, #{student[:date_of_birth]} DOB, #{student[:height]} Height)" if student [:cohort] == cohort
    end
  end
end

def print_footer
  my_puts "Overall, we have #{@students.count} great students"
end

interactive_menu

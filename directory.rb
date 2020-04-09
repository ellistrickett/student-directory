@students =  []

@months = [ "January", "Febuary", "March", "April", "May", "June", "July",
   "August", "September", "October", "November", "December"]

def add_students_to_array(name, cohort, hobbie, dob, height)
  @students << {name: name.to_sym, cohort: cohort.to_sym,
  hobbie: hobbie.to_sym, date_of_birth: dob.to_sym, height: height.to_sym}
end

def try_load_students
  filename = ARGV.first
  if filename.nil?
    filename = "students.csv"
    load_student(filename)
    my_puts "Loaded default students list 'students.csv'"
  elsif File.exists?(filename)
    load_student(filename)
    my_puts "Loaded #{students.count} from #{filename}"
  end
end

def load_student(filename)
  File.open(filename, "r") do |file|
    file.readlines.each do |line|
      name, cohort, hobbie, dob, height = line.chomp.split(',')
      add_students_to_array(name, cohort, hobbie, dob, height)
    end
  end
end

def save_students(savefilename)
  File.open(savefilename, "w") do |file|
    @students.each do |student|
      student_data = [student[:name], student[:cohort], student[:hobbie],
      student[:date_of_birth], student[:height]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
  end
end

def save_to_new_file
  while true do
    my_puts "Please enter the new name you would like to save the file to \
or hit return to go back to the menu"
    newfile = STDIN.gets.chomp
    if newfile.empty?
      break
    elsif newfile.split(//).last(4).join != ".csv"
      my_puts "Make sure it ends with '.csv'"
    else
      save_students(newfile)
      my_puts "Created a new file #{newfile} and saved the student list to it"
      break
    end
  end
end

def save_to_existing_file
  while true do
    my_puts "Please enter a a valid file name to save the list too or hit \
return to go back to menu"
  savefilename = STDIN.gets.chomp
  if savefilename.empty?
    break
  elsif savefilename.split(//).last(4).join != ".csv"
    my_puts "Make sure it ends with '.csv'"
  elsif !File.exists?(savefilename)
    my_puts "That file does not exist, try again..."
  else
    save_students(savefilename)
    my_puts "Saved student list to #{savefilename}"
    break
    end
  end
end

def enter_file_to_load
  while true do
  my_puts "Please enter a filename to load or hit return to go back to menu"
  filename = STDIN.gets.chomp
  if filename.empty?
    break
  elsif filename.split(//).last(4).join != ".csv"
    my_puts "Make sure it ends with '.csv'"
  elsif !File.exists?(filename)
    my_puts "That file does not exist, please try again."
  else
    load_student(filename)
    my_puts "Loaded #{filename} student list"
    break
    end
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
    when "1"
      my_puts "You have successfully chosen option 1"
      input_students
    when "2"
      my_puts "You have successfully chosen option 2"
      show_students
    when "3"
      my_puts "You have successfully chosen option 3"
      save_to_existing_file
    when "4"
      my_puts "You have successfully chosen option 4"
      save_to_new_file
    when "5"
      my_puts "You have successfully chosen option 5"
      enter_file_to_load
    when "9"
      my_puts "You have successfully chosen option 9"
      exit
    else
      my_puts "I don't know what you meant, try again"
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
  my_puts ""
  my_puts "1. Input the students"
  my_puts "2. Show the students"
  my_puts "3. Save list to an existing file"
  my_puts "4. Save list to a new file"
  my_puts "5. Load a list from folder"
  my_puts "9. Exit"
  my_puts ""
end

def my_puts(str)
  puts str.center(72)
end

def my_gets
  STDIN.gets.chomp.capitalize
end

def input_students
  my_puts "Enter name of student you would like to add"
  @name = my_gets
  while !@name.empty? do
    what_cohort
    questions
    count_students
    my_puts "If you have finished, just hit return twice"
    my_puts "Enter another students name"
    @name = my_gets
  end
  @students
end

def count_students
  if @students.count == 1
    my_puts "Now we have 1 student"
  else
    my_puts "Now we have #{@students.count} students"
  end
end

def questions
  my_puts "What is #{@name}'s favourite hobbie?"
  @hobbie = my_gets
  my_puts "What is #{@name}'s date of birth?"
  @dob = my_gets
  my_puts "What is #{@name}'s height?"
  @height = my_gets
  add_students_to_array(@name, @cohort, @hobbie, @dob, @height)
end

 def what_cohort
   while true do
     my_puts "What cohort is #{@name} in? If #{@name} does not have one yet, \
just press return..."
     @cohort = STDIN.gets.chomp.capitalize
     if @cohort.empty?
       @cohort = "N/A"
       break
     elsif @months.include? @cohort
       break
     end
   end
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
    my_puts "#{index}. #{student[:name]} (#{student[:hobbie]} \
Hobbie, #{student[:date_of_birth]} DOB, #{student[:height]} Height)" \
if student [:cohort] == cohort
    end
  end
end

def print_footer
  my_puts "Overall, we have #{@students.count} great students"
end

try_load_students
interactive_menu

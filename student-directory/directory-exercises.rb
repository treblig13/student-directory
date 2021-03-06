def input_students
  student_pool = []
  num_of_students = 0
  puts "Please enter the names of the students."
  puts "To print the list, press 'print' instead of a student name. There much be at least one student in order to print"
  name = check_for_typo(gets_and_chomp)
  until name == "print"
    student_pool << {name: name, cohort: valid_cohort?(get_cohort)}
    num_of_students += 1
    show_student_count(num_of_students)
    puts "Please enter the name of the next student or 'print' to print the list."
    name = check_for_typo(gets_and_chomp)
  end
  print_list_by_cohort(student_pool)
end

def gets_and_chomp
  gets.gsub("\n", "")
end

def show_student_count(num_of_students)
  if num_of_students == 1
    puts "Now we have just #{num_of_students} student."
  else
    puts "Now we have #{num_of_students} students."
  end
end

def check_for_typo(input)
  if input == "print"
    input
  else
    puts "are you sure you want to add '#{input}'? y/n?"
    answer = gets_and_chomp
    if answer == "y"
      input
    elsif answer == "n" || answer == "" || answer == nil
      puts "Please re-enter the name of the student..."
      check_for_typo(gets_and_chomp)
    end
  end
end

def valid_cohort?(cohort_input)
  valid_cohorts = [
    "jan", "feb", "mar",
    "apr", "may", "jun",
    "jul", "aug", "sept",
    "oct", "nov", "dec"
  ]
  if valid_cohorts.include?(cohort_input)
    cohort_input
  else
    puts "Please enter a valid cohort."
    cohort = valid_cohort?(gets_and_chomp)
  end
end

def get_cohort
  puts "Please enter the name of cohort the student belongs to ('jan', 'feb', 'mar', 'apr', 'may', 'jun', 'jul', 'aug', 'sept', 'oct', 'nov', 'dec')"
  cohort = gets_and_chomp
end

def print_header
  puts center_text("The Students of Villains Academy")
  puts center_text("====================")
end

def print_valid?(students)
  students.size > 0 ? true : false
end

def print_list_by_cohort(students)
  if print_valid?(students) == true
    puts "Enter the name of the cohort you would like to view"
    cohort = valid_cohort?(gets_and_chomp)
    print_header
    students.each do |student|
      if student[:cohort] == cohort
        puts center_text("#{student[:name].capitalize} (Cohort: #{student[:cohort].capitalize})")
      end
    end
    print_footer(students)
  else
    puts "You need to have added at least one student before you can print!"
    input_students
  end
end

def print_footer(students)
  if students.count == 1
    print center_text("Overall, we have just #{students.count} great student.")
  else
    print center_text("Overall, we have #{students.count} great students.")
  end
end

def center_text(text)
  text.center(170)
end

input_students

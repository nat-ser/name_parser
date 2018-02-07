# frozen_string_literal: true
require "pry"
# because DateTime.parse takes in date/month/year format
require "american_date"

# converts input csv into people objects
class Input
  def self.extract_people(file)
    raise "Input cannot be empty" if CSV.read(file).empty?
    col_sep = determine_delimeter_and_headers(file)
    people = []

    CSV.foreach(file, col_sep: col_sep, skip_blanks: true) do |row|
      standardize_row(row, col_sep)
      person = Person.new(*row)
      format_input_person_attrs(person)
      people << person
    end

    people
  end

  private_class_method

  def self.format_input_person_attrs(person)
    person.gender = format_gender!(person.gender)
    person.birth_date = DateTime.parse(person.birth_date)
  end

  def self.format_gender!(gender)
    raise "Please use input with valid gender" if gender.strip.length > 6
    return "Female" if gender.capitalize.match?(/^Female$|^F$/)
    "Male" if gender.capitalize.match?(/^Male$|^M$/)
  end

  def self.standardize_row(row, delimiter)
    # all input has a middle name that's not expected in the output
    row.delete_at(2) unless delimiter == ","
    raise "Oops! Input has to have 5 or 6 columns" unless row.length == 5
    row[3], row[4] = row[4], row[3] unless delimiter == " "
    row.map!(&:strip)
  end

  def self.determine_delimeter_and_headers(file)
    File.foreach(file) do |line|
      words = line.strip.split("")
      next if words.empty?
      return "," if words.include?(",")
      return "|" if words.include?("|")
      return " "
    end
  end
end

Person = Struct.new(:last_name, :first_name, :gender, :birth_date, :color)

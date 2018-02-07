# frozen_string_literal: true
# converts input csv into people objects
class Input
  def self.parse(file)
    raise "Input cannot be empty" if CSV.read(file).empty?
    col_sep = determine_delimeter(file)
    people = []
    CSV.foreach(file, col_sep: col_sep, skip_blanks: true) do |row|
      standardize_row(row, col_sep)
      format_row!(row)
      people << Person.new(*row)
    end
    people
  end

  private_class_method

  def self.format_row!(row)
    row.map!(&:strip)
    row[2] = format_gender!(row[2])
    row[3] = parse_date(row[3])
  end

  def self.format_gender!(gender)
    raise "Please use input with valid gender" if gender.length > 6
    gender.capitalize!
    if gender == "F"
      "Female"
    elsif gender == "M"
      "Male"
    else
      gender
    end
  end

  def self.parse_date(date)
    if date.split("").include?("/")
      Date.strptime(date.strip, "%m/%d/%Y")
    elsif date.split("").include?("-")
      Date.strptime(date.strip, "%m-%d-%Y")
    elsif date.split("").include?(".")
      Date.strptime(date.strip, "%m.%d.%Y")
    else
      Date.parse(date)
    end
  end

  def self.standardize_row(row, delimiter)
    # all input has a middle name that's not expected in the output
    row.delete_at(2) unless delimiter == ","
    raise "Oops! Can only parse input with 5 or 6 columns" unless row.length == 5
    row[3], row[4] = row[4], row[3] unless delimiter == " "
  end

  def self.determine_delimeter(file)
    File.foreach(file) do |line|
      words = line.split
      case
      when words.include?(",")
        return ","
      when words.include?("|")
        return "|"
      else
        return " "
      end
    end
  end
end

Person = Struct.new(:last_name, :first_name, :gender, :birth_date, :color)

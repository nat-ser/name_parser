# frozen_string_literal: true
# converts input csv into people objects
class Input
  def self.parse(file)
    del = delimiter(file)
    csv = CSV.read(file, col_sep: del, skip_blanks: true)
    csv.each_with_object([]) do |row, people|
      standardize_row(row, del)
      format_row!(row)
      people << Person.new(*row)
    end
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
    row.delete_at(2) unless delimiter == ","
    raise "Oops! Input has to have 5 or 6 columns" unless row.length == 5
    row[3], row[4] = row[4], row[3] unless delimiter == " "
  end

  def self.delimiter(file)
    row = first_line_with_content(file)
    raise "Input is empty" if row.nil?
    if row.split("").include?(",")
      ","
    elsif row.split("").include?("|")
      "|"
    else
      " "
    end
  end

  def self.first_line_with_content(file)
    File.foreach(file) do |line|
      line == "\n" || line.empty? ? next : (return line)
    end
  end
end

Person = Struct.new(:last_name, :first_name, :gender, :birth_date, :color)

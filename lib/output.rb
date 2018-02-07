# frozen_string_literal: true

# converts people objects to csv
class Output
  def self.to_csv(output_path, sorted_people)
    CSV.open(output_path, "w+") do |csv|
      sorted_people.each do |person|
        csv << person_to_row(person)
      end
    end
  end

  private_class_method

  def self.person_to_row(person)
    person.birth_date = format_birth_date(person.birth_date)
    person.to_a
  end

  def self.format_birth_date(date)
    date.strftime("%-m/%-d/%Y")
  end
end

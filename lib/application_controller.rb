# frozen_string_literal: true
# CLI controller to parse input into sorted output
class ApplicationController
  def self.auto_run
    convert(input_path: "input.csv",
            output_path: "output.csv",
            opts: {
              birth_date: "asc",
              color: "desc"
            })
  end

  def self.convert(input_path:, output_path:, opts: {})
    people_from_csv = Input.extract_people(input_path)
    sorted_people = PersonSorter.sort_with_opts!(people_from_csv, opts)
    Output.to_csv(output_path, sorted_people)
  end
end

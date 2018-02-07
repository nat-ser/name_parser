# frozen_string_literal: true
# CLI controller to parse input into sorted output
class ApplicationController
  def self.auto_run
    puts "\nRunning with input_path: spec/fixtures/input_pipe.csv
    and options: birth_date: 'asc', color: 'desc'"
    convert(input_path: "spec/fixtures/input_pipe.csv",
            output_path: "output.csv",
            opts: {
              birth_date: "asc",
              color: "desc"
            })
  end

  def self.convert(input_path:, output_path:, opts: {})
    people_from_csv = Input.format(input_path)
    sorted_people = PersonSorter.sort_with_opts!(people_from_csv, opts)
    Output.to_csv(output_path, sorted_people)
  end
end

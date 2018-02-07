# frozen_string_literal: true
require "spec_helper"

describe "Non-standard input" do
  let(:input_path) { "spec/fixtures/non_standard_input.csv" }
  let(:output_path) { "spec/fixtures/output_test.csv" }
  let(:comparison_path) { "spec/fixtures/output_5.csv" }

  it "sorts by 3 columns, color desc, birth_date asc, first_name desc " do
    ApplicationController.convert(input_path: input_path, output_path: output_path, opts: { color: "desc",
                                                                                            birth_date: "asc",
                                                                                            first_name: "desc" })

    files_identical = FileUtils.identical?(output_path, comparison_path)
    expect(files_identical).to eq true
  end
end

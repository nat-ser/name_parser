# frozen_string_literal: true
require "spec_helper"

describe "Comma delimited file sorts by test columns" do
  let(:input_path) { "spec/fixtures/input_comma.csv" }
  let(:output_path) { "spec/fixtures/output_test.csv" }
  let(:comparison_path_1) { "spec/fixtures/output_1.csv" }
  let(:comparison_path_2) { "spec/fixtures/output_2.csv" }
  let(:comparison_path_3) { "spec/fixtures/output_3.csv" }

  it "gender asc and last name asc" do
    ApplicationController.convert(input_path, output_path, gender: "asc",
                                                           last_name: "asc")

    files_identical = FileUtils.identical?(output_path, comparison_path_1)
    expect(files_identical).to eq true
  end

  it "birth date asc and then last name asc" do
    ApplicationController.convert(input_path, output_path, birth_date: "asc",
                                                           last_name: "asc")

    files_identical = FileUtils.identical?(output_path, comparison_path_2)
    expect(files_identical).to eq true
  end

  it "last name, desc" do
    ApplicationController.convert(input_path, output_path, last_name: "desc")

    files_identical = FileUtils.identical?(output_path, comparison_path_3)
    expect(files_identical).to eq true
  end
end

describe "Comma delimited file sorts by alternative columns" do
  let(:input_path) { "spec/fixtures/input_comma.csv" }
  let(:output_path) { "spec/fixtures/output_test.csv" }
  let(:comparison_path_4) { "spec/fixtures/output_4.csv" }

  it "color asc then first name desc" do
    ApplicationController.convert(input_path, output_path, color: "asc",
                                                           first_name: "desc")

    files_identical = FileUtils.identical?(output_path, comparison_path_4)
    expect(files_identical).to eq true
  end
end

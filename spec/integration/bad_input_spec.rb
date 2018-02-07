# frozen_string_literal: true
require "spec_helper"

describe "Bad input" do
  let(:bad_input_path) { "spec/fixtures/bad_input.csv" }
  let(:output_path) { "spec/fixtures/output_test.csv" }
  let(:empty_input_path) { "spec/fixtures/empty.csv" }

  it "throws an error when input has random fields or inconsistent format" do
    expect do
      ApplicationController.convert(input_path: bad_input_path,
                                    output_path: output_path,
                                    opts: {
                                      color: "desc",
                                      birth_date: "asc",
                                      first_name: "desc"
                                    })
    end.to raise_error(RuntimeError, "Oops! Input has to have 5 or 6 columns")
  end

  it "throws an error when input is empty" do
    expect do
      ApplicationController.convert(input_path: empty_input_path,
                                    output_path: output_path,
                                    opts: {
                                      color: "desc",
                                      birth_date: "asc",
                                      first_name: "desc"
                                    })
    end.to raise_error(RuntimeError, "Input cannot be empty")
  end
end

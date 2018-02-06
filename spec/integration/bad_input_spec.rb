# frozen_string_literal: true
require "spec_helper"

describe "Bad input" do
  let(:bad_input_path) { "spec/fixtures/bad_input.csv" }
  let(:output_path) { "spec/fixtures/output_test.csv" }

  it "throws an error when input is bad" do
    expect do
      ApplicationController.convert(bad_input_path,
                                    output_path, color: "desc",
                                                 birth_date: "asc",
                                                 first_name: "desc")
    end.to raise_error(RuntimeError, "Oops! Input has to have 5 or 6 columns")
  end
end

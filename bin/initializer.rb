# frozen_string_literal: true
### uncomment and customize to configure settings here ####

@input_path = "spec/fixtures/input_pipe.csv"
@output_path = "output.csv"

### there can be unlimited key/value pairs ####
### [:last_name, :first_name, :gender, :birth_date, :color] are the available keys ####
###  ["desc", "asc"] are available values ####

@opts = { birth_date: "desc", last_name: "desc" }

## Person sorter

##### To Run

1) clone repo
2) run `bundle` from project directory

### DEFAULT SETTINGS
1) run `rake run` to run program with default settings

### CUSTOM SETTINGS (input_path, output_path, sorting options)
1) to customize settings, go to `bin/run.rb`
comment out `ApplicationController.auto_run`
2) Configure settings `input_path` `output_path` and `opts` on lines 16-18.
3) run `rake run`

##### Note
- gender `:asc` is defined here as females first and males last

##### To Test 
1) Run `rspec` 
2) Maybe run `rubocop` if you like

Thank you for looking this over.
Hi! I look forward to getting feedback on my approach to exploring [this question from AdHoc](https://homework.adhoc.team/slcsp/)! Here are some notes to help you navigate what I have at the moment.

# Development Environment this was built with
- This was built using Ruby 3.0
- The package manager used was Bundler version 2.2.16

# Running this Script
From the command line: 
- Clone the repo from GH
- cd into the new "slcsp_excercise" directory
- run `bundle install` to install rspec
- ruby lib/slcsp_runner.rb

# Running the tests (They're all pending atm)
- run `bundle exec rspec spec/` on the command line

# Next Steps (Needless to say this isn't finished yet 😅 )
- Due to the short time alotted, this work is mostly exploratory and focused on understanding the question being asked and the data provided.
- Next steps would be dependant on the goals of the stakeholder. 
- If this was a simple data request, I would spot check the output write it to a csv and leave the code as is.
- If this were intended to be reused I would:
    - pull out smaller, single-responsibility classes that could be easily unit tested.
    - use dependancy injection instead of hard-coding the file names.

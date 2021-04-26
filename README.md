Hi 👋! I look forward to chatting with you about my approach to exploring [this question from AdHoc](https://github.com/latazzajones/technical_pre-work#slcsp-origianl-instructions)! Here are some notes to help you navigate what I have at the moment.

## Development Environment
- This was built using Ruby 3.0
- The package manager used was Bundler version 2.2.16

## Running the Script
From the command line: 
- Clone this repo from GH 
  - `git clone git@github.com:latazzajones/technical_pre-work.git`
- navigate to the directory by running `cd technical_pre-work`
- run `bundle install` to install rspec
- run `ruby lib/slcsp_runner.rb`

## Running the tests
- run `bundle exec rspec spec/` on the command line

## Next Steps 
- This work is mostly exploratory. I used the time to focus on fully understanding the question being asked and the data provided.
- Next steps would be dependant on the goals of the stakeholder. 
- If this is a one time data request; I would spot check the output, write it to a csv, and leave the code as is.
- If this is intended to be reused I would:
    - refactor and pull out smaller, single-responsibility classes that could be easily unit tested.
    - use dependancy injection instead of hard-coding the file names so that the user could use it for differnt sets of zipcodes.
    - consider building a tiny app with a form UI if non-engineering stakeholders would benefit from access to the query.

-----
-----
# SLCSP Original Instructions

## Calculate the second lowest cost silver plan

## Problem

You've been asked to determine the second lowest cost silver plan (SLCSP) for
a group of ZIP codes.

## Task

You've been given a CSV file, `slcsp.csv`, which contains the ZIP codes in the
first column. Fill in the second column with the rate (see below) of the
corresponding SLCSP and emit the answer as a CSV on stdout. Write your code in your best programming language.

### Expected output

The order of the rows in your answer as emitted on stdout must stay the same as how they
appeared in the original `slcsp.csv`. The first row should be the column headers: `zipcode,rate`
The remaining lines should output unquoted values with two digits after the decimal
place of the rates, for example: `64148,245.20`.

It may not be possible to determine a SLCSP for every ZIP code given; for example, if there is only one silver plan available, there is no _second_ lowest cost plan. Check for cases where a definitive answer cannot be found and leave those cells blank in the output CSV (no quotes or zeroes or other text). For example, `40813,`.

## Additional information

The SLCSP is the so-called "benchmark" health plan in a particular area. It's
used to compute the tax credit that qualifying individuals and families receive
on the marketplace. It's the second lowest rate for a silver plan in the rate area.

For example, if a rate area had silver plans with rates of `[197.3, 197.3, 201.1, 305.4, 306.7, 411.24]`, the SLCSP for that rate area would be `201.1`,
since it's the second lowest rate in that rate area.

A plan has a "metal level", which can be either Bronze, Silver, Gold, Platinum,
or Catastrophic. The metal level is indicative of the level of coverage the plan
provides.

A plan has a "rate", which is the amount that a consumer pays as a monthly
premium, in dollars.

A plan has a "rate area", which is a geographic region in a state that
determines the plan's rate. A rate area is a tuple of a state and a number, for
example, NY 1, IL 14.

There are two additional CSV files in this directory besides `slcsp.csv`:

- `plans.csv` — all the health plans in the U.S. on the marketplace
- `zips.csv` — a mapping of ZIP code to county/counties & rate area(s)

A ZIP code can potentially be in more than one county. If the county can not be
determined definitively by the ZIP code, it may still be possible to determine
the rate area for that ZIP code. A ZIP code can also be in more than one rate area. In that case, the answer is ambiguous
and should be left blank.

 We'll want to compile your code from source and run it from a Unix-like command line, so please include the complete instructions for doing so in a COMMENTS file.

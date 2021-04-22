#!/usr/bin/env ruby
require 'csv'
require 'pry'

class Slcsp

  def initialize
  end

  def generate_csv
    table = CSV.parse(File.read(slcsp_csv), headers: true)

    #can converters help here?
    CSV.open('new_slcsp.csv', 'w') do |new_csv|
      new_csv << ['zipcode','rate']

      table.each do |row|
        zipcode = row['zipcode']
        second_lowest_silver_plan = nil

        rate_areas_for_zip = get_rate_areas(zipcode)

        if rate_areas_for_zip.count > 1
          rates_for_zip = get_rates_for_zip(rate_areas_for_zip[0])
          rates = rates_for_zip.select {|row| row["metal_level"] == "Silver"}
          
          puts "working on zip #{zipcode}"

          next if rates.count < 2
          second_lowest_silver_plan = rates.sort_by! {|row| row["rate"]}[1]["rate"].to_f
        end

        new_csv << [zipcode, second_lowest_silver_plan]
      end
    end
  end

  private

  def get_rate_areas(zipcode)
    CSV.open('./slcsp_csv_files/zips.csv', headers: true) do |zip|
      zip_enum = zip.each

      zip_enum.select do |row|
       row["zipcode"] == zipcode 
      end
    end.map {|row| {area: row["rate_area"], state: row["state"]} }
  end

  def get_rates_for_zip(rate_area_for_zip)
    CSV.open(plans_csv, headers: true) do |plan|
      plan_enum = plan.each

      rates_for_area = plan_enum.select do |row| 
        rate_area_for_zip[:area] == row["rate_area"] &&
          rate_area_for_zip[:state] == row["state"]
      end
    end
  end

  def slcsp_csv
    './slcsp_csv_files/slcsp.csv'
  end

  def plans_csv
    './slcsp_csv_files/plans.csv'
  end


end

Slcsp.new.generate_csv

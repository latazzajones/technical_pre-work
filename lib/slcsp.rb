require 'csv'
require 'pry'

class Slcsp
  attr_accessor :slcsp_csv

  def initialize(slcsp_csv: './slcsp_csv_files/slcsp.csv')
    @slcsp_csv = slcsp_csv 
  end

  def generate_csv
    puts "zipcode,rate"

    slcsp_table.each do |row|
      puts "#{row["zipcode"]},#{second_lowest_silver_plan_rate(row["zipcode"])}"
    end
  end

  private

  def second_lowest_silver_plan_rate(zipcode)
    second_lowest_silver_plan = nil

    if get_rate_areas(zipcode).count <= 1
      rates = get_rates(get_rate_areas(zipcode)[0]).select do |row|
        row["metal_level"] == "Silver"
      end

      return nil if rates.count < 2
      second_lowest_silver_plan = rates.sort_by! {|row| row["rate"]}[1]["rate"].to_f
    end
  end

  def slcsp_table
    CSV.parse(File.read(slcsp_csv), headers: true)
  end

  def get_rate_areas(zipcode)
    CSV.open(zips_csv, headers: true) do |zip|
      zip_enum = zip.each

      zip_enum.select do |row|
       row["zipcode"] == zipcode 
      end
    end.map {|row| {area: row["rate_area"], state: row["state"]} }
  end

  def get_rates(rate_area_for_zip)
    CSV.open(plans_csv, headers: true) do |plan|
      plan_enum = plan.each

      rates_for_area = plan_enum.select do |row| 
        rate_area_for_zip[:area] == row["rate_area"] &&
          rate_area_for_zip[:state] == row["state"]
      end
    end
  end

  def zips_csv
    './slcsp_csv_files/zips.csv'
  end

  def plans_csv
    './slcsp_csv_files/plans.csv'
  end
end


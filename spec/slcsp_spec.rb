require 'rspec' 
require 'slcsp'

describe Slcsp do
  context 'the expected cvs is returned' do
    let(:test_csv) { './spec/test_slcsp.csv'}

    let(:subject) { Slcsp.new(slcsp_csv: test_csv) }

    let(:zip_with_multiple_areas) { "54923" }
    let(:zip_with_one_rate) {"40813"}
    
    #let(:stdout) { StringIO.new }

    it 'has the expected headers' do
      #binding.pry
      #expect{ subject.generate_csv }.to output("zipcode,rate").to_stdout
      pending 'not yet implemented'
    end

    it 'includes the slcsp for the expected zipcodes' do
      #expect(results[0]["rate"]).to eq ""
      pending 'not yet implemented'
    end

    it 'does not include a rate for zipcodes with multiple areas' do
      #zip with more than one rate area
      pending 'not yet implemented'
    end

    it 'does not include a rate for zipcodes with only one rate' do
      pending 'not yet implemented'
    end

  end

  context 'the expected csv is NOT returned' do
    it 'fails elegantly' do
      pending 'not yet implemented'
    end

    it 'returns a helpful error' do
      pending 'not yet implemented'
    end
  end
end

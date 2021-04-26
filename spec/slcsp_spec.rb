require 'rspec' 
require 'slcsp'

describe Slcsp do
  context 'the expected cvs is returned' do
    let(:test_csv) { './spec/test_slcsp.csv'}

    let(:subject) { Slcsp.new(slcsp_csv: test_csv) }

    let(:zip_with_multiple_areas) { "54923" }
    let(:zip_with_one_rate) {"40813"}
    
    let(:stdout) { StringIO.new }

    before do
      @old_stdout = $stdout
      $stdout = stdout
      subject.generate_csv
    end

    after { $stdout = @old_stdout }

    it 'has the expected headers' do
      expect($stdout.string).to include "zipcode,rate"
    end

    it 'includes the slcsp for the expected zipcodes' do
      expect($stdout.string).to include "64148,245.2" 
    end

    it 'does not include a rate for zipcodes with multiple areas' do
      expect($stdout.string).to include "54923,\n" 
    end

    it 'does not include a rate for zipcodes with only one rate' do
      expect($stdout.string).to include "40813,\n" 
    end

  end

  context 'the expected csv is NOT returned' do
    it 'fails elegantly' do
      skip
      pending 'not yet implemented'
    end

    it 'returns a helpful error' do
      skip
      pending 'not yet implemented'
    end
  end
end

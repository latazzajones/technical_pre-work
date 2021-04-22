require 'rspec' 
require 'slcsp'

describe Slcsp do
  context 'the expected cvs is returned' do
    let(:csv) { Slcsp.new }
    let(:zip_with_multiple_areas) { "54923" } #it does not return a value/ambiguous
    let(:zip_with_one_rate) {"40813"} #does not return a value/ambiguous

    let(:results) {csv.generate_csv}

    it 'has the expected headers' do
    end

    it 'includes the slcsp for the expected zipcodes' do
      pending 'not yet implemented'
    end

    it 'does not include anything for ambiguous zipcodes' do
      #zip with more than one rate area
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

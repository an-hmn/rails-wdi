require 'spec_helper'

describe Number do
  describe '.bin2dec' do
    it 'converts binary to decimal' do
      expect(Number.bin2dec('1101')).to eq 13
    end
  end

  describe '.dec2bin' do
    it 'converts decimal to binary' do
      expect(Number.dec2bin(13)).to eq '1101'
    end
  end
end

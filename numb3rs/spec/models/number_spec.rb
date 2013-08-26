require 'spec_helper'

describe Number do
  describe '.bin2dec' do
    it 'converts binary to decimal' do
      expect(Number.bin2dec('1101')).to eq 13
    end
  end
end

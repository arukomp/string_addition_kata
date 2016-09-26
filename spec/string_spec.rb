require 'string'

describe 'String calculator' do

  it 'returns 0 when passed an empty string' do
    expect(add("")).to eq 0
  end

  it 'returns the number itself when the string contains just one number' do
    expect(add("1")).to eq 1
  end

  it 'returns the sum of two integers seperated by a comma' do
    expect(add("3,5")).to eq 8
  end

  it 'is able to handle any amount of numbers' do
    expect(add("1,2,3,4")).to eq 10
  end

  it 'can handle new line characters as seperators' do
    expect(add("1\n2,3")).to eq 6
  end

  it 'can handle commas and new lines at the end' do
    expect(add("1,2,\n")).to eq 3
  end

  describe 'custom delimiter' do
    it 'recognises the custom delimeter' do
      expect(add("//;\n1;2;3")).to eq 6
    end
    it 'recognises a different delimeter' do
      expect(add("//d\n4d3d1")).to eq 8
    end
    it 'recognises a multi-character delimeter' do
      expect(add("//asd;\n1asd;7asd;9asd;")).to eq 17
    end
  end

  describe 'negatives' do
    it 'raises an error if the string contains a negative number' do
      expect{ add("-1") }.to raise_error "Negatives not allowed: -1"
    end
    it 'raises an error if more than one numbers are negative too' do
      expect{ add("-5, 4, 5, -2") }.to raise_error "Negatives not allowed: -5, -2"
    end
  end

  describe 'big numbers' do
    it 'should be ignored' do
      expect(add("1,3,1001")).to eq 4
    end
    it 'should not be ignored if less than or equal to 1000' do
      expect(add("5,3,1000")).to eq 1008
    end
  end

  describe '#negatives' do
    it 'has and returns a negative' do
      expect(negatives([-1])).to eq [-1]
    end
    it 'returns an empty array if there is no negative numbers' do
      expect(negatives([1, 2, 3])).to eq []
    end
  end

end

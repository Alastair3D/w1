require 'bike'

describe Bike do

  describe '#initialize' do

    it 'checks working status initialized as true' do
      expect(subject.working).to eq true
    end
  end

  describe '#report_broken' do

    it 'bikes can be reported broken' do
      subject.working = false
      expect(subject.working).to eq false
    end
  end
end

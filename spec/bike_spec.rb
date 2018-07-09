require 'bike'

describe Bike do

  it 'checks working status initialized as true' do
    expect(subject.working).to eq true
  end

  it 'can be reported broken' do
    subject.working = false
    expect(subject.working).to eq false
  end

end

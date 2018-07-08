require 'docking_station'

describe DockingStation do

  it 'responds to #release_bike' do
    expect(subject).to respond_to :release_bike
  end
  # one-liner syntax
  it { is_expected.to respond_to :release_bike }

  describe '#release_bike' do
    # remember, nested describe blocks are used to describe
    # behaviour specific to a particular method
    # it 'releases a bike' do
    #   bike = Bike.new
    #   subject.dock(bike)
    #   expect(subject.release_bike).to eq bike
    # end
    it 'raises an error when there are no bikes available' do
      # this time, we don't want to dock a bike first obviously
      # remember, subject == DockingStation.new
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end

    it 'does not release broken bikes' do
      b1 = Bike.new
      b1.report_broken
      subject.dock(b1)
      expect { subject.release_bike }.to raise_error 'No working bikes available'
    end
  end

    # it 'releases working bikes' do
    #   bike = subject.release_bike
    #   expect(bike).to be_working
    # end

  describe '#dock' do
    it 'raises an error when full' do
      # 20.times { subject.dock(Bike.new) }
        DockingStation::DEFAULT_CAPACITY.times { subject.dock(Bike.new) }
        # We are using :: as a 'Namespace operator'
        # We use it to access the DEFAULT_CAPACITY constant
      expect { subject.dock Bike.new }.to raise_error 'Docking station full'
    end
  end

  # it 'responds to #dock(bike)' do
  #   expect(subject).to respond_to :dock(bike)
  # end
  # # one-liner syntax
  # it { is_expected.to respond_to :dock(bike) }
  it { is_expected.to respond_to(:dock).with(1).argument }

  # it 'docks something' do
  #   bike = Bike.new
  #   # we want to return the bike we dock
  #   expect(subject.dock(bike)).to eq bike
  # end
  it { is_expected.to respond_to(:bike) }

describe 'initialization' do
  subject { DockingStation.new }
  let(:bike) { Bike.new }

  it 'defaults capacity' do
   described_class::DEFAULT_CAPACITY.times do
     subject.dock(bike)
  end
   expect{ subject.dock(bike) }.to raise_error 'Docking station full'
 end
end



end

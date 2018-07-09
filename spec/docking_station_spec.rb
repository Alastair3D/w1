require 'docking_station'
require 'bike'

describe DockingStation do
    subject { DockingStation.new }
    let(:bike) { double :bike, working: true }
    let(:broken_bike) { double :broken_bike, working: false }
    DEFAULT_CAPACITY = 20

  describe '#initialize' do
# nested describe blocks used to describe behaviour specific to a given #method
    it 'defaults @capacity when no paramaters are passed' do
      station = DockingStation.new
      expect(station.capacity).to eq(DEFAULT_CAPACITY)
    end

    it 'allows variable @capacity to be set' do
      low_capacity = 10
      station = DockingStation.new(low_capacity)
      expect(station.capacity).to eq(low_capacity)
    end
  end


  describe '#release_bike' do
    # it 'responds to #release_bike' do
    #   expect(subject).to respond_to :release_bike
    # end
    # # one-liner syntax
    # it { is_expected.to respond_to :release_bike }
    it 'releases a working bike even if a broken bike was last docked' do
      subject.dock(bike)
      subject.dock(broken_bike)
      expect(subject.release_bike).to eq(bike)
    end

    it 'raises an error when there are no bikes available' do
      # we don't want to dock a bike first obviously
      # subject == DockingStation.new
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end

    it 'does not release broken bikes' do
      subject.dock(broken_bike)
      expect { subject.release_bike }.to raise_error 'No working bikes available'
    end
  end


  describe '#dock' do
    # it 'responds to #dock(bike)' do
    #   expect(subject).to respond_to :dock(bike)
    # end
    # # one-liner syntax
    # it { is_expected.to respond_to :dock(bike) }
    it { is_expected.to respond_to(:dock).with(1).argument }

    it 'allows both working and broken bikes to be docked' do
      subject.dock(bike)
      subject.dock(broken_bike)
      expect([subject.bikes.last, subject.broken_bikes.last]).to eq([bike, broken_bike])
    end

    it 'raises an error when full' do
      # 20.times { subject.dock(Bike.new) }
      # DockingStation::DEFAULT_CAPACITY.times { subject.dock(Bike.new) }
# # :: is a 'Namespace operator' used to access the DEFAULT_CAPACITY constant
      # expect { subject.dock Bike.new }.to raise_error 'Docking station full'
    subject.capacity.times { subject.dock(bike) }
    expect { subject.dock(bike) }.to raise_error 'Docking station full'
    end
  end

end

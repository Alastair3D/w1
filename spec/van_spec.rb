require 'van'
require 'docking_station'
require 'bike'

describe Van do
let(:bike) {double :bike, working: true}
let(:broken_bike) {double :broken_bike, working: false}
let(:station) {double :station, bikes: [], broken_bikes: [] }
let(:station2) {double :station2, dock: [broken_bike], broken_bikes: [broken_bike]}
let(:garage) {double :garage, bikes: []}
let(:garage_fixed) {double :garage_fixed, bikes: [bike]}


  describe '#collect_broken_bikes' do
    # it 'returns an array of broken bikes' do
    #   station.dock(broken_bike)
    #   expect(subject.collect_broken_bikes(station)).to eq [broken_bike]
    # end
    it 'raises an error when there are no broken bikes to collect' do
      station2.dock(broken_bike)
      subject.collect_broken_bikes(station2)
      expect{subject.collect_broken_bikes(station2)}.to raise_error 'No broken bikes to collect'
    end
  end

  describe '#deliver_broken_bikes' do
    it 'deposits broken_bikes at the garage' do
      expect(subject.deliver_broken_bikes(garage)).to eq []
    end
  end

  describe '#collect_repaired_bikes' do
    it 'picks up repaired bikes from the garage' do
      expect(subject.collect_repaired_bikes(garage_fixed)).to eq [bike]
    end
  end

  # describe '#distribute_repaired_bikes' do
  # #   it 'returns repaired bikes to a station' do
  # #     expect(subject.distribute_repaired_bikes(station)).to eq []
  # #   end
  #     it 'raises an error when there are no broken bikes to distribute' do
  #       expect(subject.distribute_repaired_bikes(station)).to raise_error 'No repaired bikes to distribute'
  #     end
  #   end
end

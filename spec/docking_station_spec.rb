require_relative '../lib/docking_station'

describe DockingStation do

let(:broken_bike) { double(:bike, broken?: true) }
let (:working_bike) { double(:bike, broken?: false) }
let(:station) {DockingStation.new(:capacity => 20)}

def fill_station(station)
	20.times {station.dock(Bike.new)}
end
  it "should be empty" do
    expect(station.bike_count).to eq(0)
  end

  it "should accept a bike" do
    station.dock(working_bike)
    expect(station.bike_count).to eq(1)
  end

  it "should release a bike" do
    station.dock(working_bike)
    station.release(working_bike)
    expect(station.bike_count).to eq(0)
  end

  it "should know when it is full" do
    fill_station(station)
    expect(station).to be_full
  end

  it "should not accept a bike if it is full" do
    fill_station(station)
    expect(lambda{station.dock(working_bike)}).to raise_error(RuntimeError)
  end

  it "should provide a list of available bikes" do
    station.dock(working_bike)
    station.dock(broken_bike)
    expect(station.available_bikes).to eq([working_bike])
  end

  it "should only rent out working_bikes" do
    station.dock(broken_bike)
    station.dock(working_bike)
    expect(station.rent).to eq working_bike
  end

  # it "should not rent out a working_bike if empty" do
  #   expect{station.rent}.to raise_error(RuntimeError)
  # end
 
  it 'drops the broken bikes into the van' do
    van = double :van
    station.dock(broken_bike)
    expect(van).to receive(:dock).with(broken_bike)
    station.drop_bikes_into(van)
  end
end
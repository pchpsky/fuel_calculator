require 'fuel_calculator'

RSpec.describe FuelCalculator do
  subject { described_class.new }

  describe '#fuel_for_route' do
    context 'for landing Apollo 11 on Earth' do
      let(:mass) { 28_801 }
      let(:flight_route) do
        [
          [:land, 9.807]
        ]
      end

      it 'calculates the total fuel required' do
        expect(subject.fuel_for_route(mass, flight_route)).to eq(13_447)
      end
    end

    context 'for Apollo 11 mission' do
      let(:mass) { 28_801 }
      let(:flight_route) do
        [
          [:launch, 9.807],
          [:land, 1.62],
          [:launch, 1.62],
          [:land, 9.807]
        ]
      end

      it 'calculates the total fuel required' do
        expect(subject.fuel_for_route(mass, flight_route)).to eq(51_898)
      end
    end

    context 'for mission on Mars' do
      let(:mass) { 14_606 }
      let(:flight_route) do
        [
          [:launch, 9.807],
          [:land, 3.711],
          [:launch, 3.711],
          [:land, 9.807]
        ]
      end

      it 'calculates the total fuel required' do
        expect(subject.fuel_for_route(mass, flight_route)).to eq(33_388)
      end
    end

    context 'for passanger ship' do
      let(:mass) { 75_432 }
      let(:flight_route) do
        [
          [:launch, 9.807],
          [:land, 1.62],
          [:launch, 1.62],
          [:land, 3.711],
          [:launch, 3.711],
          [:land, 9.807]
        ]
      end

      it 'calculates the total fuel required' do
        expect(subject.fuel_for_route(mass, flight_route)).to eq(212_161)
      end
    end
  end
end

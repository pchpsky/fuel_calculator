require 'fuel_calculator'

RSpec.describe FuelCalculator do
  subject { described_class.new }

  describe '#calculate_total_fuel' do
    context 'for landing Apollo 11 on Earth' do
      let(:mass) { 28801 }
      let(:flight_route) do
        [
          [:land, 9.807]
        ]
      end

      it 'calculates the total fuel required' do
        expect(subject.calculate_total_fuel(mass, flight_route)).to eq(13447)
      end
    end

    context 'for Apollo 11 mission' do
      let(:mass) { 28801 }
      let(:flight_route) do
        [
          [:launch, 9.807],
          [:land, 1.62],
          [:launch, 1.62],
          [:land, 9.807]
        ]
      end

      it 'calculates the total fuel required' do
        expect(subject.calculate_total_fuel(mass, flight_route)).to eq(51898)
      end
    end

    context 'for mission on Mars' do
      let(:mass) { 14606 }
      let(:flight_route) do
        [
          [:launch, 9.807],
          [:land, 3.711],
          [:launch, 3.711],
          [:land, 9.807]
        ]
      end

      it 'calculates the total fuel required' do
        expect(subject.calculate_total_fuel(mass, flight_route)).to eq(33388)
      end
    end

    context 'for passanger ship' do
      let(:mass) { 75432 }
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
        expect(subject.calculate_total_fuel(mass, flight_route)).to eq(212161)
      end
    end
  end
end

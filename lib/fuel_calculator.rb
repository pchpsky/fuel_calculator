class FuelCalculator
  def calculate_total_fuel(mass, flight_route)
    flight_route.reverse.reduce(0) do |total_fuel, (action, gravity)|
      total_fuel + calculate_additional_fuel(mass + total_fuel, action, gravity)
    end
  end

  def calculate_additional_fuel(fuel, action, gravity)
    additional_fuel = 0
    loop do
      fuel = calculate_fuel(fuel, action, gravity)
      break if fuel <= 0

      additional_fuel += fuel
    end

    additional_fuel
  end

  def calculate_fuel(mass, action, gravity)
    if action == :launch
      calculate_fuel_for_launch(mass, gravity)
    else
      calculate_fuel_for_landing(mass, gravity)
    end
  end

  def calculate_fuel_for_launch(mass, gravity)
    (mass * gravity * 0.042 - 33).floor
  end

  def calculate_fuel_for_landing(mass, gravity)
    (mass * gravity * 0.033 - 42).floor
  end
end

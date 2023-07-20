class FuelCalculator
  def fuel_for_route(initial_mass, flight_route)
    flight_route.reverse.reduce(0) do |total_fuel, (action, gravity)|
      total_mass = initial_mass + total_fuel
      total_fuel + calculate_fuel(total_mass, action, gravity)
    end
  end

  private

  def calculate_fuel(mass, action, gravity)
    total_fuel(mass, fuel_formula(action, gravity))
  end

  def total_fuel(mass, fuel_formula)
    Enumerator
      .produce(fuel_formula.call(mass), &fuel_formula)
      .take_while(&:positive?)
      .sum
  end

  def fuel_formula(action, gravity)
    if action == :launch
      ->(mass) { fuel_for_launch(mass, gravity) }
    else
      ->(mass) { fuel_for_landing(mass, gravity) }
    end
  end

  def fuel_for_launch(mass, gravity)
    (mass * gravity * 0.042 - 33).floor
  end

  def fuel_for_landing(mass, gravity)
    (mass * gravity * 0.033 - 42).floor
  end
end

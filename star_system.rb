class StarSystem
  attr_reader :name, :planets

  def initialize(name, planets)
    @name = name
    @planets = planets
  end

  def planet_names
    @planets.map { |planet| planet.name }
  end

  def get_planet_by_name(planet_name)
    @planets.find {|planet| planet.name == planet_name}
  end

  def get_largest_planet
    @planets.max_by {|planet| planet.diameter}
  end

  def get_smallest_planet
    @planets.min_by {|planet| planet.diameter}
  end

  def get_planets_with_no_moons
    @planets.find_all {|planet| planet.number_of_moons == 0}
  end

  def get_planets_with_more_moons(number)
    moony_planets = @planets.find_all {|planet| planet.number_of_moons > number}
    moony_planets.map {|planet| planet.name}
  end

  def get_number_of_planets_closer_than(number)
    # close_planets = @planets.find_all {|planet| planet.distance_from_sun < number}
    # close_planets.map {|planet| planet.name}.count
    @planets.count {|planet| planet.distance_from_sun < number}
  end

  def get_total_number_of_moons
    @planets.reduce(0) {|total, planet| total + planet.number_of_moons}
  end

  def get_planet_names_sorted_by_increasing_distance_from_sun
    planets_by_distance = @planets.sort_by {|planet| planet.distance_from_sun}
    planets_by_distance.map {|planet| planet.name}
  end

  # def get_planet_names_sorted_by_size_decreasing
  #   planets_by_size = @planets.sort_by {|planet| planet.diameter}
  #   planets_by_size.map {|planet| planet.name}.reverse!
  # end

  def get_planet_names_sorted_by_size_decreasing
    planets_by_size = @planets.sort { |planet1, planet2| planet2.diameter <=> planet1.diameter }
    return planets_by_size.map { |planet| planet.name }
  end

end

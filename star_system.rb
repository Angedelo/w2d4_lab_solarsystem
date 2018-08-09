class StarSystem
  attr_reader :name, :planets

  def initialize(name, planets)
    @name = name
    @planets = planets
  end

  def planet_names
    planets.map { |planet| planet.name }
  end

  def get_planet_by_name(planet_name)
    planets.find {|planet| planet.name == planet_name}
  end

  def get_largest_planet
    planets.max_by {|planet| planet.diameter}
  end

  def get_smallest_planet
    planets.min_by {|planet| planet.diameter}
  end

  def get_planets_with_no_moons
    planets.find_all {|planet| planet.number_of_moons == 0}
  end

  def get_planets_with_more_moons(number)
    moony_planets = planets.find_all {|planet| planet.number_of_moons > number}
    moony_planets.map {|planet| planet.name}
  end

  def get_number_of_planets_closer_than(number)
    close_planets = planets.find_all {|planet| planet.distance_from_sun < number}
    close_planets.map {|planet| planet.name}
    close_planets.count
  end

end

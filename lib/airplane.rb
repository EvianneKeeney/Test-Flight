require 'pry'
class Airplane
  attr_reader :type, :wing_loading, :horsepower
  attr_accessor :engine, :flying, :fuel
  def initialize(type, wing_loading, horsepower, engine, flying, fuel)
    @type = type
    @wing_loading = wing_loading
    @horsepower = horsepower
    @engine = engine
    @flying = flying
    @fuel = 100
  end

  def engine
    if @engine == 'on'
      @engine = true
    else @engine == 'off'
      @engine = false
    end
  end

  def flying
    if @flying == 'in air'
      @flying = true
    else @flying == 'disembarked'
      @flying = false
    end
  end

  def start
    if @engine == 'off'
      return "airplane started"
      @engine = 'on'
    else @engine = 'on'
      return "airplane already started"
    end

    @fuel -= 10

  end

  def takeoff
    if @engine == 'off'
      return "airplane not started, please start"
      @engine = 'on'
    else @engine == 'on'
      return "airplane launched"
      @flying = 'in air'
    end
    fuel -= 30
  end

  def land
    if @engine == 'off'
      return "airplane not started, please start"

    elsif @engine == 'on'
      @flying == 'disembarked'
      return "airplane is already on the ground"


    else @engine == 'on'
      @flying == "in air"
      return "airplane landed"
    end
  end

end

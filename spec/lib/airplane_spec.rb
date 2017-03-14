require_relative "../../lib/airplane"
RSpec.describe Airplane do
let(:my_plane) { Airplane.new("cesna", 10, 150, @engine, @flying) }

  describe ".new" do
    it "takes type, wing_loading, and horsepower as arguments" do
      expect(my_plane).to be_a(Airplane)
    end
  end

  describe "#type" do
    it "returns the airplane type" do
      expect(my_plane.type).to eq("cesna")
    end
  end

  describe "#wing_loading" do
    it "returns the airplane wing_loading capacity" do
      expect(my_plane.wing_loading).to eq(10)
    end
  end

  describe "horsepower" do
    it "returns the airplane horsepower" do
      expect(my_plane.horsepower).to eq(150)
    end
  end

  describe "start" do
    it "starts the plane" do
      @engine = "off"
      expect(my_plane.start).to eq("airplane started")
    end

    context "when the engine is on" do
      it "returns that the engine was already running" do
        @engine = 'on'
        expect(my_plane.engine).to eq(true)
        expect(my_plane.start).to eq("airplane already started")
      end
    end
  end

  describe "takeoff" do
    it "checks to see if the engine is running" do
      @engine = "off"
      expect(my_plane.takeoff).to eq("airplane not started, please start")
    end

    context "when the engine is on" do
      it "initiates a launch and announces takeoff" do
        @engine = 'on'
        expect(my_plane.engine).to eq(true)
        expect(my_plane.takeoff).to eq("airplane launched")
        expect(my_plane.flying).to eq(false)
      end
    end

  end

  describe "land" do
    it "checks to see if the engine is running" do
      @engine = 'off'
      expect(my_plane.land).to eq("airplane not started, please start")
    end
    it "checks to see if the plane has launched" do
      @engine = 'on'
      @flying = 'disembarked'
      expect(my_plane.land).to eq("airplane is already on the ground")
    end
    it "lands the plane" do
      @engine = true
      @flying = true
      expect(my_plane.land).to eq("airplane landed")
    end
  end

end

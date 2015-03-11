require 'minitest_helper'

class ColorPoundSpecReporterTest < Minitest::Test
  describe ColorPoundSpecReporter do
    it "#method and :method and true and false are all Colorful" do
      assert true
    end

    it "intentionally skips #with :some Colors true" do
      skip
    end

    it "intentional fail #with :some Colors true" do
      true . must_equal false
    end

    it "intentional error" do
      raise "Some message with true, false, #method, :symbol, and Class."
    end
  end
end

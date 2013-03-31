$LOAD_PATH.unshift File.join(File.dirname(__FILE__), '..', 'lib')
require 'stubber'
require 'minitest/autorun'

class StubberTest < MiniTest::Unit::TestCase
  def test_instance_stub
    x = "Apples"
    String.instance_stub :to_s, "Bananas" do
      assert_equal "Bananas", x.to_s
      assert_equal "Bananas", "Apples".to_s
    end
    assert_equal "Apples", x.to_s
  end

  def test_instance_stub_with_block
    x = "Apples"
    x.custom_stub :to_s, "Bananas" do
      assert_equal "Bananas", x.to_s
    end

    assert_equal "Apples", x.to_s
  end

  def test_instance_stub_side_effects
    x = "Apples"
    x.custom_stub :to_s, "Bananas"
    assert_equal "Bananas", x.to_s
    assert_equal "Apples", "Apples".to_s
  end

  def test_passes_arguments
    x = 2
    Fixnum.instance_stub :+, 5 do
      assert_equal 5, x + 2
    end
  end
end

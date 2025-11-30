defmodule LiveViewNativeNuklearTest do
  use ExUnit.Case

  describe "platforms/0" do
    test "returns the Nuklear platform" do
      assert LiveViewNativeNuklear.platforms() == [LiveViewNativeNuklear.Platform]
    end
  end

  describe "element defaults" do
    test "Window has expected defaults" do
      defaults = LiveViewNativeNuklear.Elements.Window.defaults()
      assert defaults.width == 800
      assert defaults.height == 600
    end

    test "Slider has expected defaults" do
      defaults = LiveViewNativeNuklear.Elements.Slider.defaults()
      assert defaults.step == 1.0
    end

    test "CodeBuffer has expected defaults" do
      defaults = LiveViewNativeNuklear.Elements.CodeBuffer.defaults()
      assert defaults.language == "strudel"
    end
  end
end

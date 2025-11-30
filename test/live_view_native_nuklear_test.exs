defmodule LiveViewNativeNuklearTest do
  use ExUnit.Case
  doctest LiveViewNativeNuklear

  test "platform struct is defined" do
    platform = %LiveViewNativeNuklear{}
    assert platform.format == :nuklear
    assert platform.component == LiveViewNativeNuklear.Component
    assert platform.module_suffix == :Nuklear
  end
end

defmodule LiveViewNativeNuklear.Elements.Slider do
  @moduledoc """
  Numeric value slider element.

  Maps to Nuklear's `nk_slider_float()` call.

  ## Attributes

  - `min` - Minimum value (required)
  - `max` - Maximum value (required)
  - `value` - Current value (required)
  - `step` - Value increment (default: 1.0)
  - `phx-change` - Phoenix change event handler
  - `phx-value-*` - Additional event values

  ## Example

      <Slider min="60" max="200" value={@bpm} step="1" phx-change="set_bpm"/>
      <Slider min="0" max="1" value={@volume} step="0.01" phx-change="set_volume"/>

  ## Nuklear Mapping

  ```c
  float new_value = nk_slide_float(ctx, min, value, max, step);
  if (new_value != value) {
      // send phx-change event with new_value
  }
  ```
  """

  @doc """
  Returns the default attributes for a Slider element.
  """
  def defaults do
    %{
      step: 1.0
    }
  end
end

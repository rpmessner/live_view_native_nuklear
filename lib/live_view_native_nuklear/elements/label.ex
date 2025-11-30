defmodule LiveViewNativeNuklear.Elements.Label do
  @moduledoc """
  Text display element.

  Maps to Nuklear's `nk_label()` call.

  ## Attributes

  - `text` - Label text (required)
  - `align` - Text alignment: "left", "center", "right" (default: "left")
  - `wrap` - Enable text wrapping (default: false)

  ## Example

      <Label text="Cycle: 0.00"/>
      <Label text={@status_message} align="center"/>

  ## Nuklear Mapping

  ```c
  nk_label(ctx, text, alignment);
  // or
  nk_label_wrap(ctx, text);
  ```
  """

  @doc """
  Returns the default attributes for a Label element.
  """
  def defaults do
    %{
      align: "left",
      wrap: false
    }
  end
end

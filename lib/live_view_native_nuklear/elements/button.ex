defmodule LiveViewNativeNuklear.Elements.Button do
  @moduledoc """
  Clickable button element.

  Maps to Nuklear's `nk_button_label()` call.

  ## Attributes

  - `label` - Button text (required)
  - `phx-click` - Phoenix click event handler
  - `phx-value-*` - Additional event values

  ## Example

      <Button label="Play" phx-click="toggle_transport"/>
      <Button label="Delete" phx-click="delete_pattern" phx-value-id={@pattern_id}/>

  ## Nuklear Mapping

  ```c
  if (nk_button_label(ctx, label)) {
      // send phx-click event to server
  }
  ```
  """

  @doc """
  Returns the default attributes for a Button element.
  """
  def defaults do
    %{}
  end
end

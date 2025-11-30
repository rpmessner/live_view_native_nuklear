defmodule LiveViewNativeNuklear.Elements.TextInput do
  @moduledoc """
  Text entry field element.

  Maps to Nuklear's `nk_edit_string()` call.

  ## Attributes

  - `value` - Current text value
  - `placeholder` - Placeholder text when empty
  - `max_length` - Maximum text length (default: 256)
  - `phx-change` - Phoenix change event handler
  - `phx-blur` - Phoenix blur event handler

  ## Example

      <TextInput value={@pattern_name} phx-change="update_name"/>

  ## Nuklear Mapping

  ```c
  nk_edit_string(ctx, NK_EDIT_FIELD, buffer, &len, max_length, nk_filter_default);
  ```
  """

  @doc """
  Returns the default attributes for a TextInput element.
  """
  def defaults do
    %{
      max_length: 256,
      placeholder: ""
    }
  end
end

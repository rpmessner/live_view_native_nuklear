defmodule LiveViewNativeNuklear.Elements.Row do
  @moduledoc """
  Horizontal layout row element.

  Maps to Nuklear's `nk_layout_row_dynamic()` or `nk_layout_row_static()` calls.

  ## Attributes

  - `height` - Row height in pixels (required)
  - `cols` - Number of columns (required)
  - `dynamic` - If true, columns have dynamic width (default: false)

  ## Example

      <Row height={30} cols={3}>
        <Label text="Left" />
        <Label text="Center" />
        <Label text="Right" />
      </Row>

  ## Nuklear Mapping

  ```c
  // Dynamic width columns
  nk_layout_row_dynamic(ctx, height, cols);
  // Or static width columns
  nk_layout_row_static(ctx, height, width, cols);
  ```
  """

  @doc """
  Returns the default attributes for a Row element.
  """
  def defaults do
    %{
      dynamic: false
    }
  end
end

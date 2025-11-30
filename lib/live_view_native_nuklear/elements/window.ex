defmodule LiveViewNativeNuklear.Elements.Window do
  @moduledoc """
  Top-level window container element.

  Maps to Nuklear's `nk_begin()` / `nk_end()` calls.

  ## Attributes

  - `title` - Window title (required)
  - `x` - X position (default: 0)
  - `y` - Y position (default: 0)
  - `width` - Window width (default: 800)
  - `height` - Window height (default: 600)
  - `flags` - Nuklear window flags (default: "border,movable,scalable,title")

  ## Example

      <Window title="My Application" width="1280" height="720">
        <Panel title="Content">
          ...
        </Panel>
      </Window>

  ## Nuklear Mapping

  ```c
  if (nk_begin(ctx, title, nk_rect(x, y, w, h), flags)) {
      // children rendered here
  }
  nk_end(ctx);
  ```
  """

  @default_flags "border,movable,scalable,title"

  @doc """
  Returns the default attributes for a Window element.
  """
  def defaults do
    %{
      x: 0,
      y: 0,
      width: 800,
      height: 600,
      flags: @default_flags
    }
  end
end

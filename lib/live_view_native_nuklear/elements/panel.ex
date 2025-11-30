defmodule LiveViewNativeNuklear.Elements.Panel do
  @moduledoc """
  Grouped content area element.

  Maps to Nuklear's `nk_group_begin()` / `nk_group_end()` calls.

  ## Attributes

  - `title` - Panel title (required)
  - `flags` - Nuklear group flags (default: "border,title")

  ## Example

      <Panel title="Editor">
        <CodeBuffer buffer_id="main" language="strudel"/>
      </Panel>

  ## Nuklear Mapping

  ```c
  if (nk_group_begin(ctx, title, flags)) {
      // children rendered here
      nk_group_end(ctx);
  }
  ```
  """

  @default_flags "border,title"

  @doc """
  Returns the default attributes for a Panel element.
  """
  def defaults do
    %{
      flags: @default_flags
    }
  end
end

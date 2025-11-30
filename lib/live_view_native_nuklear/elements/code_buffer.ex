defmodule LiveViewNativeNuklear.Elements.CodeBuffer do
  @moduledoc """
  Embedded Neovim code editor element.

  This is a custom element for Undertow that renders an embedded Neovim instance
  for code editing with full vim power.

  ## Attributes

  - `buffer_id` - Unique identifier for this buffer (required)
  - `language` - Syntax highlighting language (default: "strudel")
  - `content` - Initial buffer content
  - `phx-eval` - Phoenix event triggered on Ctrl+Enter

  ## Example

      <CodeBuffer buffer_id="d1" language="strudel" phx-eval="evaluate_pattern"/>

  ## Client Implementation

  The native client spawns `nvim --embed` and uses msgpack-RPC to:
  - Attach a UI with specified rows/cols
  - Route keyboard input to Neovim
  - Render Neovim's grid to the Nuklear widget area
  - Capture Ctrl+Enter to send evaluation events
  """

  @doc """
  Returns the default attributes for a CodeBuffer element.
  """
  def defaults do
    %{
      language: "strudel"
    }
  end
end

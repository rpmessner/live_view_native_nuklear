defmodule LiveViewNativeNuklear.Elements.Tab do
  @moduledoc """
  Individual tab within a TabBar.

  ## Attributes

  - `id` - Unique identifier for this tab (required)
  - `label` - Display text for the tab (required)

  ## Example

      <Tab id="code" label="Code" />

  ## Client Implementation

  Rendered as a button that when clicked sends `tab:select` event with the tab ID.
  The active tab is highlighted based on the parent TabBar's `active` attribute.
  """

  @doc """
  Returns the default attributes for a Tab element.
  """
  def defaults do
    %{}
  end
end

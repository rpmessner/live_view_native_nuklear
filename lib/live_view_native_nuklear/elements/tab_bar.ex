defmodule LiveViewNativeNuklear.Elements.TabBar do
  @moduledoc """
  Tab bar container element for tabbed interfaces.

  ## Attributes

  - `active` - ID of the currently active tab

  ## Example

      <TabBar active={@active_tab}>
        <Tab id="code" label="Code" />
        <Tab id="viz" label="Visualization" />
      </TabBar>

  ## Client Implementation

  The native client renders this as a horizontal row of tab buttons.
  Clicking a tab sends a `phx-click` event with the tab ID.
  """

  @doc """
  Returns the default attributes for a TabBar element.
  """
  def defaults do
    %{}
  end
end

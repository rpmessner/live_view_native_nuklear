defmodule LiveViewNativeNuklear.Component do
  @moduledoc """
  Base component module for Nuklear LiveView Native components.

  Use this module in your components to get Nuklear-specific helpers:

      defmodule MyAppWeb.Components.Nuklear do
        use LiveViewNativeNuklear.Component

        def transport_bar(assigns, _interface) do
          ~NUKLEAR\"\"\"
          <Panel title="Transport">
            <Button label={if @playing, do: "Stop", else: "Play"} phx-click="toggle_play"/>
            <Label text={"BPM: \#{@bpm}"}/>
          </Panel>
          \"\"\"
        end
      end
  """

  defmacro __using__(_opts) do
    quote do
      use LiveViewNative.Component, format: :nuklear

      import LiveViewNativeNuklear.Component
    end
  end

  @doc """
  Helper to build phx-value-* attributes from a map.

  ## Example

      <Button label="Delete" phx-click="delete" {phx_values(id: @item.id, type: "user")}/>
  """
  def phx_values(values) when is_list(values) do
    Enum.map(values, fn {key, value} ->
      {:"phx-value-#{key}", value}
    end)
  end
end

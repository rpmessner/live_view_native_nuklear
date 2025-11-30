defmodule LiveViewNativeNuklear do
  @moduledoc """
  LiveView Native platform for Nuklear immediate-mode GUI.

  This platform enables rendering Phoenix LiveView templates as Nuklear UI
  in native C++ clients. It's designed for the Undertow Native Client but
  can be used for any Nuklear-based application.

  ## Configuration

  Add to your Phoenix application's config:

      config :live_view_native, plugins: [
        LiveViewNativeNuklear
      ]

      config :mime, :types, %{
        "text/nuklear" => [:nuklear]
      }

      config :phoenix_template, :format_encoders, [
        nuklear: Phoenix.HTML.Engine
      ]

      config :phoenix, :template_engines,
        neex: LiveViewNative.Engine

  ## Usage

  Create a format-specific render component:

      defmodule MyAppWeb.HomeLive.Nuklear do
        use LiveViewNative.Component,
          format: :nuklear,
          as: :render
      end

  Then create a template at `home_live.nuklear.neex`:

      <Window title="My App" width={800} height={600}>
        <Panel title="Main">
          <Label text={@message} />
          <Button label="Click me" phx-click="click" />
        </Panel>
      </Window>

  ## Elements

  Core elements supported:

  - `<Window>` - Top-level window container
  - `<Panel>` - Grouping container with optional title
  - `<Button>` - Clickable button with phx-click
  - `<Label>` - Text display
  - `<Slider>` - Value slider with phx-change
  - `<TextInput>` - Text input field
  - `<TabBar>` - Tabbed interface
  - `<Menu>` - Dropdown menu
  - `<CodeBuffer>` - Embedded Neovim code editor
  - `<Visualization>` - Vulkan visualization component
  """

  use LiveViewNative,
    format: :nuklear,
    component: LiveViewNativeNuklear.Component,
    module_suffix: :Nuklear,
    template_engine: LiveViewNative.Template.Engine
end

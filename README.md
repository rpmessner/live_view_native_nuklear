# LiveView Native Nuklear

LiveView Native platform for [Nuklear](https://github.com/Immediate-Mode-UI/Nuklear) immediate-mode GUI.

This platform enables rendering Phoenix LiveView templates as Nuklear UI in native C++ clients. It's the bridge between your Elixir/Phoenix server and a Vulkan/Nuklear native client.

## Installation

Add to your `mix.exs`:

```elixir
def deps do
  [
    {:live_view_native_nuklear, path: "../live_view_native_nuklear"}
    # Or when published: {:live_view_native_nuklear, "~> 0.1.0"}
  ]
end
```

## Configuration

Add to your `config/config.exs`:

```elixir
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
```

## Usage

### 1. Create a LiveView

```elixir
defmodule MyAppWeb.HomeLive do
  use MyAppWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket,
      bpm: 120.0,
      cycle: 0.0,
      playing: false,
      code: "s(\"bd sd\")"
    )}
  end

  def render(assigns) do
    # This renders for web clients
    ~H"""
    <div>Web interface</div>
    """
  end

  def handle_event("transport:play", _, socket) do
    {:noreply, assign(socket, playing: true)}
  end
end
```

### 2. Create a Nuklear Render Component

```elixir
defmodule MyAppWeb.HomeLive.Nuklear do
  use LiveViewNativeNuklear.Component

  def render(assigns, _interface) do
    ~LVN"""
    <Window title="Undertow" width={1280} height={720}>
      <Panel title="Transport">
        <Transport playing={@playing} bpm={@bpm} cycle={@cycle} />
      </Panel>

      <Panel title="Code">
        <CodeBuffer buffer_id="main" content={@code} />
      </Panel>
    </Window>
    """
  end
end
```

### 3. Or Use Template Files

Create `home_live.nuklear.neex`:

```heex
<Window title="Undertow" width={1280} height={720}>
  <Panel title="Transport">
    <Transport playing={@playing} bpm={@bpm} cycle={@cycle} />
  </Panel>

  <Panel title="Code">
    <CodeBuffer buffer_id="main" content={@code} />
  </Panel>
</Window>
```

## Elements

### Container Elements

| Element | Nuklear Mapping | Description |
|---------|-----------------|-------------|
| `<Window>` | `nk_begin()` | Top-level window |
| `<Panel>` | `nk_group_begin()` | Content grouping |
| `<Row>` | `nk_layout_row_*()` | Horizontal layout |
| `<TabBar>` | Custom | Tabbed interface |

### Basic Widgets

| Element | Nuklear Mapping | Description |
|---------|-----------------|-------------|
| `<Button>` | `nk_button_label()` | Clickable button |
| `<Label>` | `nk_label()` | Text display |
| `<Slider>` | `nk_slider_float()` | Value slider |
| `<TextInput>` | `nk_edit_string()` | Text input |

### Custom Elements

| Element | Description |
|---------|-------------|
| `<CodeBuffer>` | Embedded Neovim editor |
| `<Visualization>` | Vulkan visualization |
| `<Transport>` | Playback controls |

## Events

All standard Phoenix LiveView events work:

- `phx-click` - Click events
- `phx-change` - Value change events
- `phx-blur` - Focus loss events
- `phx-submit` - Form submission

Custom events for Undertow:

- `phx-eval` - Code evaluation (Ctrl+Enter in CodeBuffer)

## Architecture

```
┌─────────────────────────────────────────────┐
│  Phoenix LiveView Server                     │
│  ├── LiveView (your app logic)              │
│  ├── Nuklear Render Component               │
│  └── ~LVN templates                          │
└─────────────────────────────────────────────┘
                    │
                    │ LiveView Native WebSocket
                    │ (JSON diffs, statics/dynamics)
                    ▼
┌─────────────────────────────────────────────┐
│  Native Client (C++)                         │
│  ├── liveview-native-core (Rust bindings)   │
│  ├── DOM → Nuklear renderer                 │
│  └── Vulkan for visualizations              │
└─────────────────────────────────────────────┘
```

## Development

```bash
cd live_view_native_nuklear
mix deps.get
mix test
```

## License

MIT

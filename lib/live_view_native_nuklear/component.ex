defmodule LiveViewNativeNuklear.Component do
  @moduledoc """
  Component module for LiveView Native Nuklear platform.

  Provides the base components and element definitions for Nuklear UI.
  Use this module in your render components:

      defmodule MyAppWeb.HomeLive.Nuklear do
        use LiveViewNativeNuklear.Component
        # or
        use LiveViewNative.Component,
          format: :nuklear,
          as: :render
      end
  """

  use LiveViewNative.Component

  defmacro __using__(_opts) do
    quote do
      use LiveViewNative.Component,
        format: :nuklear

      import unquote(__MODULE__)
    end
  end

  # ============================================================================
  # Core Container Elements
  # ============================================================================

  @doc """
  Top-level window container.

  Maps to Nuklear's `nk_begin()` / `nk_end()`.

  ## Attributes

  - `title` - Window title (required)
  - `x` - X position (default: 0)
  - `y` - Y position (default: 0)
  - `width` - Width in pixels (default: 800)
  - `height` - Height in pixels (default: 600)
  - `flags` - Nuklear window flags (default: "border|title|movable|scalable")

  ## Example

      <Window title="Undertow" width={1280} height={720}>
        <Panel title="Editor">
          ...
        </Panel>
      </Window>
  """
  attr :title, :string, required: true
  attr :x, :integer, default: 0
  attr :y, :integer, default: 0
  attr :width, :integer, default: 800
  attr :height, :integer, default: 600
  attr :flags, :string, default: "border|title|movable|scalable"
  slot :inner_block, required: true

  def window(assigns, _interface) do
    ~LVN"""
    <Window
      title={@title}
      x={@x}
      y={@y}
      width={@width}
      height={@height}
      flags={@flags}
    >
      {render_slot(@inner_block)}
    </Window>
    """
  end

  @doc """
  Panel container for grouping widgets.

  Maps to Nuklear's `nk_group_begin()` / `nk_group_end()`.

  ## Attributes

  - `title` - Panel title (optional)
  - `flags` - Nuklear group flags (default: "border|title")
  - `height` - Fixed height, or 0 for auto (default: 0)

  ## Example

      <Panel title="Transport">
        <Button label="Play" phx-click="play" />
        <Button label="Stop" phx-click="stop" />
      </Panel>
  """
  attr :title, :string, default: nil
  attr :flags, :string, default: "border|title"
  attr :height, :integer, default: 0
  slot :inner_block, required: true

  def panel(assigns, _interface) do
    ~LVN"""
    <Panel
      title={@title}
      flags={@flags}
      height={@height}
    >
      {render_slot(@inner_block)}
    </Panel>
    """
  end

  # ============================================================================
  # Basic Widgets
  # ============================================================================

  @doc """
  Clickable button.

  Maps to Nuklear's `nk_button_label()`.

  ## Attributes

  - `label` - Button text (required)
  - `phx-click` - Event to send on click

  ## Example

      <Button label="Play" phx-click="transport:play" />
  """
  attr :label, :string, required: true
  attr :"phx-click", :string, default: nil
  attr :"phx-value-*", :any, default: nil

  def button(assigns, _interface) do
    ~LVN"""
    <Button
      label={@label}
      phx-click={assigns[:"phx-click"]}
    />
    """
  end

  @doc """
  Text label.

  Maps to Nuklear's `nk_label()`.

  ## Attributes

  - `text` - Label text (required)
  - `align` - Text alignment: "left", "center", "right" (default: "left")
  - `wrap` - Whether to wrap text (default: false)

  ## Example

      <Label text={"Cycle: #{@cycle}"} align="center" />
  """
  attr :text, :string, required: true
  attr :align, :string, default: "left"
  attr :wrap, :boolean, default: false

  def label(assigns, _interface) do
    ~LVN"""
    <Label
      text={@text}
      align={@align}
      wrap={to_string(@wrap)}
    />
    """
  end

  @doc """
  Value slider.

  Maps to Nuklear's `nk_slider_float()`.

  ## Attributes

  - `min` - Minimum value (default: 0.0)
  - `max` - Maximum value (default: 1.0)
  - `value` - Current value (required)
  - `step` - Step size (default: 0.01)
  - `phx-change` - Event to send on value change

  ## Example

      <Slider
        min={60}
        max={200}
        value={@bpm}
        step={1}
        phx-change="bpm:change"
      />
  """
  attr :min, :float, default: 0.0
  attr :max, :float, default: 1.0
  attr :value, :float, required: true
  attr :step, :float, default: 0.01
  attr :"phx-change", :string, default: nil

  def slider(assigns, _interface) do
    ~LVN"""
    <Slider
      min={@min}
      max={@max}
      value={@value}
      step={@step}
      phx-change={assigns[:"phx-change"]}
    />
    """
  end

  @doc """
  Text input field.

  Maps to Nuklear's `nk_edit_string()`.

  ## Attributes

  - `value` - Current text value (required)
  - `placeholder` - Placeholder text (default: "")
  - `phx-change` - Event to send on text change
  - `phx-blur` - Event to send on blur
  - `multiline` - Allow multiple lines (default: false)

  ## Example

      <TextInput
        value={@pattern_name}
        placeholder="Pattern name..."
        phx-change="pattern:rename"
      />
  """
  attr :value, :string, required: true
  attr :placeholder, :string, default: ""
  attr :"phx-change", :string, default: nil
  attr :"phx-blur", :string, default: nil
  attr :multiline, :boolean, default: false

  def text_input(assigns, _interface) do
    ~LVN"""
    <TextInput
      value={@value}
      placeholder={@placeholder}
      phx-change={assigns[:"phx-change"]}
      phx-blur={assigns[:"phx-blur"]}
      multiline={to_string(@multiline)}
    />
    """
  end

  # ============================================================================
  # Layout Elements
  # ============================================================================

  @doc """
  Tabbed interface container.

  ## Attributes

  - `active` - Currently active tab ID

  ## Example

      <TabBar active={@active_tab}>
        <Tab id="code" label="Code" />
        <Tab id="viz" label="Visualization" />
      </TabBar>
  """
  attr :active, :string, required: true
  slot :inner_block, required: true

  def tab_bar(assigns, _interface) do
    ~LVN"""
    <TabBar active={@active}>
      {render_slot(@inner_block)}
    </TabBar>
    """
  end

  @doc """
  Tab definition within TabBar.

  ## Attributes

  - `id` - Tab identifier (required)
  - `label` - Tab label text (required)
  - `phx-click` - Event for tab selection (default: "tab:select")
  """
  attr :id, :string, required: true
  attr :label, :string, required: true
  attr :"phx-click", :string, default: "tab:select"

  def tab(assigns, _interface) do
    ~LVN"""
    <Tab
      id={@id}
      label={@label}
      phx-click={assigns[:"phx-click"]}
      phx-value-tab={@id}
    />
    """
  end

  @doc """
  Horizontal layout row.

  Maps to Nuklear's `nk_layout_row_dynamic()` or `nk_layout_row_static()`.

  ## Attributes

  - `height` - Row height in pixels (default: 30)
  - `cols` - Number of columns (default: 1)
  - `dynamic` - Use dynamic width (default: true)

  ## Example

      <Row height={40} cols={3}>
        <Button label="A" />
        <Button label="B" />
        <Button label="C" />
      </Row>
  """
  attr :height, :integer, default: 30
  attr :cols, :integer, default: 1
  attr :dynamic, :boolean, default: true
  slot :inner_block, required: true

  def row(assigns, _interface) do
    ~LVN"""
    <Row
      height={@height}
      cols={@cols}
      dynamic={to_string(@dynamic)}
    >
      {render_slot(@inner_block)}
    </Row>
    """
  end

  # ============================================================================
  # Custom Undertow Elements
  # ============================================================================

  @doc """
  Embedded Neovim code buffer.

  This is a custom element for the Undertow native client that embeds
  a Neovim instance for code editing.

  ## Attributes

  - `buffer_id` - Identifier for this buffer (required)
  - `language` - Syntax highlighting language (default: "strudel")
  - `content` - Initial buffer content (default: "")
  - `phx-eval` - Event to send on Ctrl+Enter (default: "code:eval")

  ## Example

      <CodeBuffer
        buffer_id="d1"
        language="strudel"
        content={@code}
        phx-eval="eval:pattern"
      />
  """
  attr :buffer_id, :string, required: true
  attr :language, :string, default: "strudel"
  attr :content, :string, default: ""
  attr :"phx-eval", :string, default: "code:eval"

  def code_buffer(assigns, _interface) do
    ~LVN"""
    <CodeBuffer
      buffer_id={@buffer_id}
      language={@language}
      content={@content}
      phx-eval={assigns[:"phx-eval"]}
    />
    """
  end

  @doc """
  Vulkan visualization component.

  Renders pattern or audio data as a visualization.

  ## Attributes

  - `type` - Visualization type: "pianoroll", "spiral", "scope", "spectrum"
  - `data` - Visualization data (patterns or audio analysis)
  - `playhead` - Current playhead position (0.0-1.0)

  ## Example

      <Visualization
        type="pianoroll"
        data={@patterns}
        playhead={@cycle}
      />
  """
  attr :type, :string, required: true
  attr :data, :any, default: nil
  attr :playhead, :float, default: 0.0

  def visualization(assigns, _interface) do
    ~LVN"""
    <Visualization
      type={@type}
      data={Jason.encode!(@data || [])}
      playhead={@playhead}
    />
    """
  end

  @doc """
  Transport control bar.

  Pre-built component for playback controls.

  ## Attributes

  - `playing` - Whether currently playing (required)
  - `bpm` - Current BPM (required)
  - `cycle` - Current cycle position (required)

  ## Example

      <Transport
        playing={@playing}
        bpm={@bpm}
        cycle={@cycle}
      />
  """
  attr :playing, :boolean, required: true
  attr :bpm, :float, required: true
  attr :cycle, :float, required: true

  def transport(assigns, _interface) do
    play_label = if assigns.playing, do: "Stop", else: "Play"
    play_event = if assigns.playing, do: "transport:stop", else: "transport:play"

    assigns =
      assigns
      |> assign(:play_label, play_label)
      |> assign(:play_event, play_event)

    ~LVN"""
    <Row height={40} cols={4}>
      <Button label={@play_label} phx-click={@play_event} />
      <Label text={"BPM: #{Float.round(@bpm, 1)}"} align="center" />
      <Slider min={60} max={200} value={@bpm} step={1} phx-change="transport:bpm" />
      <Label text={"Cycle: #{Float.round(@cycle, 2)}"} align="right" />
    </Row>
    """
  end
end

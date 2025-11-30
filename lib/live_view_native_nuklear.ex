defmodule LiveViewNativeNuklear do
  @moduledoc """
  LiveView Native platform for Nuklear immediate-mode GUI.

  This platform enables Phoenix LiveView applications to render native
  Nuklear interfaces through the LiveView Native protocol.

  ## Usage

  Add to your application's config:

      config :live_view_native,
        platforms: [LiveViewNativeNuklear]

  Then create `.nuklear.heex` templates alongside your LiveViews:

      # lib/my_app_web/live/home_live.nuklear.heex
      <Window title="My App" width="1280" height="720">
        <Panel title="Controls">
          <Button label="Click me" phx-click="button_clicked"/>
        </Panel>
      </Window>

  ## Elements

  - `<Window>` - Top-level window container
  - `<Panel>` - Grouped content area
  - `<Button>` - Clickable button
  - `<Label>` - Text display
  - `<Slider>` - Numeric value slider
  - `<TextInput>` - Text entry field
  - `<CodeBuffer>` - Embedded Neovim editor (custom)
  - `<Visualization>` - Vulkan visualization (custom)
  """

  use LiveViewNativePlatform,
    otp_app: :live_view_native_nuklear

  def platforms do
    [LiveViewNativeNuklear.Platform]
  end
end

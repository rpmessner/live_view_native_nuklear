defmodule LiveViewNativeNuklear.Elements.Visualization do
  @moduledoc """
  Vulkan visualization element.

  This is a custom element for Undertow that renders pattern and audio
  visualizations using Vulkan render-to-texture.

  ## Attributes

  - `type` - Visualization type: "pianoroll", "spiral", "oscilloscope", "spectrum"
  - `data` - Pattern/audio data from assigns (for pianoroll)
  - `width` - Visualization width
  - `height` - Visualization height

  ## Example

      <Visualization type="pianoroll" data={@pattern_events} width="400" height="200"/>
      <Visualization type="oscilloscope" width="200" height="100"/>

  ## Data Sources

  - **pianoroll**: Pattern events from LVN assigns
  - **spiral**: Pattern events (polar view)
  - **oscilloscope**: Waveform from binary audio socket
  - **spectrum**: FFT data from binary audio socket

  ## Client Implementation

  The native client:
  - Renders visualizations to Vulkan textures
  - Uses `nk_image()` to display as Nuklear widgets
  - Updates pianoroll/spiral from LVN assigns
  - Updates oscilloscope/spectrum from binary socket at 60fps
  """

  @visualization_types ~w(pianoroll spiral oscilloscope spectrum)

  @doc """
  Returns the valid visualization types.
  """
  def types, do: @visualization_types

  @doc """
  Returns the default attributes for a Visualization element.
  """
  def defaults do
    %{
      width: 400,
      height: 200
    }
  end
end

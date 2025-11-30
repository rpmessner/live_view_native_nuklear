defmodule LiveViewNativeNuklear.Platform do
  @moduledoc """
  Platform configuration for Nuklear.

  Implements the `LiveViewNativePlatform.Kit` protocol to register
  the Nuklear platform with LiveView Native.
  """

  defstruct []

  defimpl LiveViewNativePlatform.Kit do
    def compile(_struct) do
      LiveViewNativePlatform.Env.define(:nuklear,
        otp_app: :live_view_native_nuklear,
        render_macro: :sigil_NUKLEAR,
        template_extension: ".nuklear.heex",
        tag_handler: LiveViewNative.TagEngine
      )
    end
  end
end

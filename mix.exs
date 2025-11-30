defmodule LiveViewNativeNuklear.MixProject do
  use Mix.Project

  @version "0.1.0"
  @source_url "https://github.com/rpmessner/live_view_native_nuklear"

  def project do
    [
      app: :live_view_native_nuklear,
      version: @version,
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      package: package(),
      docs: docs()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:live_view_native, "~> 0.3"},
      {:phoenix_live_view, "~> 1.0"},
      {:phoenix_html, "~> 4.0"},
      {:jason, "~> 1.2"},
      {:ex_doc, "~> 0.24", only: :dev, runtime: false}
    ]
  end

  defp description do
    """
    LiveView Native platform for Nuklear immediate-mode GUI.
    Renders Phoenix LiveView templates as Nuklear UI in native C++ clients.
    """
  end

  defp package do
    [
      maintainers: ["Ryan Messner"],
      licenses: ["MIT"],
      links: %{"GitHub" => @source_url}
    ]
  end

  defp docs do
    [
      main: "readme",
      extras: ["README.md"]
    ]
  end
end

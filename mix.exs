defmodule LiveViewNativeNuklear.MixProject do
  use Mix.Project

  @version "0.1.0"
  @source_url "https://github.com/rpmessner/live_view_native_nuklear"

  def project do
    [
      app: :live_view_native_nuklear,
      version: @version,
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      docs: docs(),
      description: "LiveView Native platform for Nuklear immediate-mode GUI"
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:live_view_native, "~> 0.4.0-rc"},
      {:live_view_native_platform, "~> 0.2.0"},
      {:phoenix, "~> 1.7"},
      {:phoenix_live_view, "~> 1.0"},
      {:ex_doc, "~> 0.30", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      maintainers: ["Ryan Messner"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => @source_url
      },
      files: ~w(lib mix.exs README.md LICENSE)
    ]
  end

  defp docs do
    [
      main: "readme",
      extras: ["README.md"],
      source_url: @source_url,
      source_ref: "v#{@version}"
    ]
  end
end

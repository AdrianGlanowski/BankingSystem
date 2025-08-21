defmodule BankingSystem.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      BankingSystemWeb.Telemetry,
      BankingSystem.Repo,
      {DNSCluster, query: Application.get_env(:banking_system, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: BankingSystem.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: BankingSystem.Finch},
      # Start a worker by calling: BankingSystem.Worker.start_link(arg)
      # {BankingSystem.Worker, arg},
      # Start to serve requests, typically the last entry
      BankingSystemWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: BankingSystem.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    BankingSystemWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

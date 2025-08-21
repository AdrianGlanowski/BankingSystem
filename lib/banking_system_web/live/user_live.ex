defmodule BankingSystemWeb.UserLive do
  use BankingSystemWeb, :live_view

  alias BankingSystem.User
  def mount(_params, _session, socket) do
    socket = assign(socket, users: User.get_all())
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <table>
    <tr>
      <th>name</th><th>last name</th><th>gender</th><th>birth date</th>
    </tr>
    <%= for user <- @users do %>
      <tr>
        <td><%= user.name %></td>
        <td><%= user.last_name %></td>
        <td><%= user.gender %></td>
        <td><%= user.birth_date %></td>
      </tr>
    <% end %>
    </table>
    """
  end
end

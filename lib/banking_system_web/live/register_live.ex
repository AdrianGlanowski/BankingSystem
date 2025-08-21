defmodule BankingSystemWeb.RegisterLive do
  use BankingSystemWeb, :live_view

  def mount(_params, _session, socket) do
    socket = assign(socket, name: "dummy", last_name: "", gender: "", birth_date: "")
    {:ok, socket}
  end

  @spec handle_event(<<_::64>>, map(), any()) :: {:noreply, any()}
  def handle_event("register", %{"name" => name, "last_name" => last_name, "gender" => gender, "birth_date" => birth_date}, socket) do
    BankingSystem.User.register(name, last_name, gender, birth_date)
    socket = assign(socket, name: name, last_name: last_name, gender: gender, birth_date: birth_date)
    {:noreply, socket}
  end

  def render(assigns) do
      ~H"""
      <form phx-submit="register">
        Name: <input type="text" name="name" value={@name} > <br/>
        Last name: <input type="text" name="last_name" value={@last_name}> <br/>
        Gender: <select name="gender">
            <option disabled selected value label=" " style="display:none"/>
            <option label={"F"} value={"F"} selected = {F == @gender} />
            <option label={"M"} value={"M"} selected = {M == @gender} />
          </select><br/>
        Birth date: <input type="date" name="birth_date" value={@birth_date}> <br/>
        <input type="submit" value="register"/>
      </form>

      <%= @name %>
      <%= @last_name %>
      <%= @gender %>
      <%= @birth_date %>

      """
    end
end

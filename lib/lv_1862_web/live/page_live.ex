defmodule Lv1862Web.PageLive do
  use Lv1862Web, :live_view

  alias Lv1862Web.Row

  def mount(_, _, socket) do
    {:ok, assign(socket, :selected, [])}
  end

  def render(assigns) do
    ~H"""
    <p>
      Click the row to select — click the link to see the error
    </p>
    <div class="rows">
      <%= for i <- 0..5 do %>
        <.live_component module={Row} id={"row#{i}"} row={i} selected={@selected} />
      <% end %>
    </div>
    """
  end

  def handle_info({:update_selected, selected}, socket) do
    {:noreply, assign(socket, :selected, selected)}
  end
end

defmodule Lv1862Web.Row do
  use Lv1862Web, :live_component
  alias Phoenix.LiveView.JS

  def render(assigns) do
    ~H"""
    <div class={["row", @row in @selected && "selected"]} phx-click={JS.push("select_row", value: %{id: @row}, target: @myself)}>
      <a data-phx-link="redirect" data-phx-link-state="push" href="/link">Click link</a>
    </div>
    """
  end

  def handle_event("select_row", %{"id" => id}, %{assigns: %{selected: selected}} = socket) do
    send(self(), {:update_selected, (id in selected && selected -- [id]) || [id | selected]})
    {:noreply, socket}
  end
end

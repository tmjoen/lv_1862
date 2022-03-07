defmodule Lv1862Web.LinkLive do
  use Lv1862Web, :live_view

  def mount(_, _, socket) do
    {:ok, assign(socket, :selected, [])}
  end

  def render(assigns) do
    ~H"""
    <p>Gone linkin'</p>
    """
  end
end

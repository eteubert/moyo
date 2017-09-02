defmodule MoyoWeb.ShowController do
  use MoyoWeb, :controller

  alias Moyo.Studio
  alias Moyo.Studio.Show

  def new(conn, _params) do
    show = Studio.change_show(%Show{})
    render conn, "new.html", show: show
  end

  def create(conn, %{"show" => show_params}) do
    case Studio.create_show(show_params) do
      {:ok, _show} ->
        conn
        |> put_flash(:info, "Show created successfully.")
        |> redirect(to: inbox_path(conn, :index))
      {:error, %Ecto.Changeset{} = show} ->
        render(conn, "new.html", show: show)
    end
  end
end

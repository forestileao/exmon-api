defmodule ExMonWeb.TrainersView do
  use ExMonWeb, :view
  alias ExMon.Trainer

  def render("create.json", %{
        trainer: trainer,
        token: token
      }) do
    %{
      message: "Trainer created",
      trainer: trainer |> Map.take([:id, :name, :inserted_at]),
      token: token
    }
  end

  def render("sign_in.json", result), do: result |> Map.take([:token])

  def render("update.json", %{trainer: trainer}) do
    %{
      message: "Trainer updated!",
      trainer: trainer |> Map.take([:id, :name, :inserted_at, :updated_at])
    }
  end

  def render("show.json", %{trainer: trainer}) do
    trainer |> Map.take([:id, :name, :inserted_at])
  end
end

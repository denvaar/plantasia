defmodule PlantasiaWeb.ContentResolver do
  alias Plantasia.Content

  def plants(_root, _args, _info) do
    plants = Content.list_plants()

    {:ok, plants}
  end

  def create_plant(_root, args, _info) do
    case Content.create_plant(args) do
      {:ok, plant} ->
        {:ok, plant}
      _error ->
        {:error, "could not add plant"}
    end
  end

  def update_plant(_root, args, _info) do
    plant = Content.get_plant!(args[:id])

    case Content.update_plant(plant, Map.drop(args, [:id])) do
      {:ok, plant} ->
        {:ok, plant}
      _error ->
        {:error, "could not remove plant"}
    end
  end

  def delete_plant(_root, %{id: id} = _args, _info) do
    plant = Content.get_plant!(id)

    case Content.delete_plant(plant) do
      {:ok, plant} ->
        {:ok, plant}
      _error ->
        {:error, "could not remove plant"}
    end
  end
end

defmodule Plantasia.Content.Plant do
  use Ecto.Schema
  import Ecto.Changeset

  schema "plants" do
    field :botanical_name, :string
    field :common_name, :string
    field :light_requirements, :string
    field :mature_size, :string
    field :care_notes, :string
    field :first_image, :string
    field :second_image, :string

    timestamps()
  end

  @doc false
  def changeset(plant, attrs) do
    plant
    |> cast(attrs, [
      :botanical_name,
      :common_name,
      :light_requirements,
      :mature_size,
      :care_notes,
      :first_image,
      :second_image])
    |> validate_required([
      :common_name,
      :first_image])
  end
end

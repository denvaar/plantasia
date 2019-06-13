defmodule Plantasia.Repo.Migrations.CreatePlants do
  use Ecto.Migration

  def change do
    create table(:plants) do
      add :botanical_name, :string
      add :common_name, :string
      add :light_requirements, :string
      add :mature_size, :string
      add :care_notes, :text
      add :first_image, :string
      add :second_image, :string

      timestamps()
    end

  end
end

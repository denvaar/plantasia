defmodule PlantasiaWeb.Schema do
  use Absinthe.Schema

  alias PlantasiaWeb.ContentResolver

  object :plant do
    field :id, non_null(:id)
    field :botanical_name, :string
    field :common_name, non_null(:string)
    field :light_requirements, :string
    field :mature_size, :string
    field :care_notes, :string
    field :first_image, non_null(:string)
    field :second_image, :string
  end

  query do
    field :plants, non_null(list_of(non_null(:plant))) do
      resolve &ContentResolver.plants/3
    end
  end

  mutation do
    field :create_plant, :plant do

      arg :botanical_name, :string
      arg :common_name, non_null(:string)
      arg :light_requirements, :string
      arg :mature_size, :string
      arg :care_notes, :string
      arg :first_image, non_null(:string)
      arg :second_image, :string

      resolve &ContentResolver.create_plant/3
    end

    field :edit_plant, :plant do
      arg :id, non_null(:id)
      arg :botanical_name, :string
      arg :common_name, :string
      arg :light_requirements, :string
      arg :mature_size, :string
      arg :care_notes, :string
      arg :first_image, :string
      arg :second_image, :string

      resolve &ContentResolver.update_plant/3
    end

    field :delete_plant, :plant do
      arg :id, non_null(:id)

      resolve &ContentResolver.delete_plant/3
    end
  end
end

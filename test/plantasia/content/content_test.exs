defmodule Plantasia.ContentTest do
  use Plantasia.DataCase

  alias Plantasia.Content

  describe "plants" do
    alias Plantasia.Content.Plant

    @valid_attrs %{image: "some image", name: "some name"}
    @update_attrs %{image: "some updated image", name: "some updated name"}
    @invalid_attrs %{image: nil, name: nil}

    def plant_fixture(attrs \\ %{}) do
      {:ok, plant} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Content.create_plant()

      plant
    end

    test "list_plants/0 returns all plants" do
      plant = plant_fixture()
      assert Content.list_plants() == [plant]
    end

    test "get_plant!/1 returns the plant with given id" do
      plant = plant_fixture()
      assert Content.get_plant!(plant.id) == plant
    end

    test "create_plant/1 with valid data creates a plant" do
      assert {:ok, %Plant{} = plant} = Content.create_plant(@valid_attrs)
      assert plant.image == "some image"
      assert plant.name == "some name"
    end

    test "create_plant/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Content.create_plant(@invalid_attrs)
    end

    test "update_plant/2 with valid data updates the plant" do
      plant = plant_fixture()
      assert {:ok, %Plant{} = plant} = Content.update_plant(plant, @update_attrs)
      assert plant.image == "some updated image"
      assert plant.name == "some updated name"
    end

    test "update_plant/2 with invalid data returns error changeset" do
      plant = plant_fixture()
      assert {:error, %Ecto.Changeset{}} = Content.update_plant(plant, @invalid_attrs)
      assert plant == Content.get_plant!(plant.id)
    end

    test "delete_plant/1 deletes the plant" do
      plant = plant_fixture()
      assert {:ok, %Plant{}} = Content.delete_plant(plant)
      assert_raise Ecto.NoResultsError, fn -> Content.get_plant!(plant.id) end
    end

    test "change_plant/1 returns a plant changeset" do
      plant = plant_fixture()
      assert %Ecto.Changeset{} = Content.change_plant(plant)
    end
  end
end

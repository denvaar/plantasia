defmodule PlantasiaWeb.PlantControllerTest do
  use PlantasiaWeb.ConnCase

  alias Plantasia.Content
  alias Plantasia.Content.Plant

  @create_attrs %{
    image: "some image",
    name: "some name"
  }
  @update_attrs %{
    image: "some updated image",
    name: "some updated name"
  }
  @invalid_attrs %{image: nil, name: nil}

  def fixture(:plant) do
    {:ok, plant} = Content.create_plant(@create_attrs)
    plant
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all plants", %{conn: conn} do
      conn = get(conn, Routes.plant_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create plant" do
    test "renders plant when data is valid", %{conn: conn} do
      conn = post(conn, Routes.plant_path(conn, :create), plant: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.plant_path(conn, :show, id))

      assert %{
               "id" => id,
               "image" => "some image",
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.plant_path(conn, :create), plant: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update plant" do
    setup [:create_plant]

    test "renders plant when data is valid", %{conn: conn, plant: %Plant{id: id} = plant} do
      conn = put(conn, Routes.plant_path(conn, :update, plant), plant: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.plant_path(conn, :show, id))

      assert %{
               "id" => id,
               "image" => "some updated image",
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, plant: plant} do
      conn = put(conn, Routes.plant_path(conn, :update, plant), plant: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete plant" do
    setup [:create_plant]

    test "deletes chosen plant", %{conn: conn, plant: plant} do
      conn = delete(conn, Routes.plant_path(conn, :delete, plant))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.plant_path(conn, :show, plant))
      end
    end
  end

  defp create_plant(_) do
    plant = fixture(:plant)
    {:ok, plant: plant}
  end
end

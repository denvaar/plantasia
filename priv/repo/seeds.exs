# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Plantasia.Repo.insert!(%Plantasia.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.


alias Plantasia.Content.Plant
alias Plantasia.Repo

%Plant{
  common_name: "Moss",
  botanical_name: "Mosseus",
  light_requirements: "Keep in light",
  mature_size: "10ft",
  care_notes: "Take good care of it",
  first_image: "https://www.gardens4you.co.uk/media/catalog/product/cache/1/image/500x/9df78eab33525d08d6e5fb8d27136e95/F/D/FD19294WH_93.jpg",
  second_image: "https://5.imimg.com/data5/BQ/PP/MY-38022806/monstera-deliciosa-plant-500x500.jpg"
} |> Repo.insert!()

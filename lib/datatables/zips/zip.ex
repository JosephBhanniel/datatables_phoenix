defmodule Datatables.Zips.Zip do
  use Ecto.Schema
  import Ecto.Changeset

  schema "zips" do
    field :state, :string
    field :zip_code, :string
    field :city, :string

    timestamps()
  end

  @doc false
  def changeset(zip, attrs) do
    zip
    |> cast(attrs, [:zip_code, :city, :state])
    |> validate_required([:zip_code, :city, :state])
  end
end

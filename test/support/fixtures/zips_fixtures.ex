defmodule Datatables.ZipsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Datatables.Zips` context.
  """

  @doc """
  Generate a zip.
  """
  def zip_fixture(attrs \\ %{}) do
    {:ok, zip} =
      attrs
      |> Enum.into(%{
        state: "some state",
        zip_code: "some zip_code",
        city: "some city"
      })
      |> Datatables.Zips.create_zip()

    zip
  end
end

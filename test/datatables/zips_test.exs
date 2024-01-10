defmodule Datatables.ZipsTest do
  use Datatables.DataCase

  alias Datatables.Zips

  describe "zips" do
    alias Datatables.Zips.Zip

    import Datatables.ZipsFixtures

    @invalid_attrs %{state: nil, zip_code: nil, city: nil}

    test "list_zips/0 returns all zips" do
      zip = zip_fixture()
      assert Zips.list_zips() == [zip]
    end

    test "get_zip!/1 returns the zip with given id" do
      zip = zip_fixture()
      assert Zips.get_zip!(zip.id) == zip
    end

    test "create_zip/1 with valid data creates a zip" do
      valid_attrs = %{state: "some state", zip_code: "some zip_code", city: "some city"}

      assert {:ok, %Zip{} = zip} = Zips.create_zip(valid_attrs)
      assert zip.state == "some state"
      assert zip.zip_code == "some zip_code"
      assert zip.city == "some city"
    end

    test "create_zip/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Zips.create_zip(@invalid_attrs)
    end

    test "update_zip/2 with valid data updates the zip" do
      zip = zip_fixture()
      update_attrs = %{state: "some updated state", zip_code: "some updated zip_code", city: "some updated city"}

      assert {:ok, %Zip{} = zip} = Zips.update_zip(zip, update_attrs)
      assert zip.state == "some updated state"
      assert zip.zip_code == "some updated zip_code"
      assert zip.city == "some updated city"
    end

    test "update_zip/2 with invalid data returns error changeset" do
      zip = zip_fixture()
      assert {:error, %Ecto.Changeset{}} = Zips.update_zip(zip, @invalid_attrs)
      assert zip == Zips.get_zip!(zip.id)
    end

    test "delete_zip/1 deletes the zip" do
      zip = zip_fixture()
      assert {:ok, %Zip{}} = Zips.delete_zip(zip)
      assert_raise Ecto.NoResultsError, fn -> Zips.get_zip!(zip.id) end
    end

    test "change_zip/1 returns a zip changeset" do
      zip = zip_fixture()
      assert %Ecto.Changeset{} = Zips.change_zip(zip)
    end
  end
end

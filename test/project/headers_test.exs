defmodule Project.HeadersTest do
  use Project.DataCase

  alias Project.Headers

  describe "headers" do
    alias Project.Headers.Header

    import Project.HeadersFixtures

    @invalid_attrs %{body: nil, title: nil}

    test "list_headers/0 returns all headers" do
      header = header_fixture()
      assert Headers.list_headers() == [header]
    end

    test "get_header!/1 returns the header with given id" do
      header = header_fixture()
      assert Headers.get_header!(header.id) == header
    end

    test "create_header/1 with valid data creates a header" do
      valid_attrs = %{body: "some body", title: "some title"}

      assert {:ok, %Header{} = header} = Headers.create_header(valid_attrs)
      assert header.body == "some body"
      assert header.title == "some title"
    end

    test "create_header/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Headers.create_header(@invalid_attrs)
    end

    test "update_header/2 with valid data updates the header" do
      header = header_fixture()
      update_attrs = %{body: "some updated body", title: "some updated title"}

      assert {:ok, %Header{} = header} = Headers.update_header(header, update_attrs)
      assert header.body == "some updated body"
      assert header.title == "some updated title"
    end

    test "update_header/2 with invalid data returns error changeset" do
      header = header_fixture()
      assert {:error, %Ecto.Changeset{}} = Headers.update_header(header, @invalid_attrs)
      assert header == Headers.get_header!(header.id)
    end

    test "delete_header/1 deletes the header" do
      header = header_fixture()
      assert {:ok, %Header{}} = Headers.delete_header(header)
      assert_raise Ecto.NoResultsError, fn -> Headers.get_header!(header.id) end
    end

    test "change_header/1 returns a header changeset" do
      header = header_fixture()
      assert %Ecto.Changeset{} = Headers.change_header(header)
    end
  end
end

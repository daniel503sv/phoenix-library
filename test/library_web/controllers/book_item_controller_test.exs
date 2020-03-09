defmodule LibraryWeb.BookItemControllerTest do
  use LibraryWeb.ConnCase

  alias Library.Items

  @create_attrs %{book_id: 42, book_items: "some book_items", id: "some id"}
  @update_attrs %{book_id: 43, book_items: "some updated book_items", id: "some updated id"}
  @invalid_attrs %{book_id: nil, book_items: nil, id: nil}

  def fixture(:book_item) do
    {:ok, book_item} = Items.create_book_item(@create_attrs)
    book_item
  end

  describe "index" do
    test "lists all book_items", %{conn: conn} do
      conn = get(conn, Routes.book_item_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Book items"
    end
  end

  describe "new book_item" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.book_item_path(conn, :new))
      assert html_response(conn, 200) =~ "New Book item"
    end
  end

  describe "create book_item" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.book_item_path(conn, :create), book_item: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.book_item_path(conn, :show, id)

      conn = get(conn, Routes.book_item_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Book item"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.book_item_path(conn, :create), book_item: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Book item"
    end
  end

  describe "edit book_item" do
    setup [:create_book_item]

    test "renders form for editing chosen book_item", %{conn: conn, book_item: book_item} do
      conn = get(conn, Routes.book_item_path(conn, :edit, book_item))
      assert html_response(conn, 200) =~ "Edit Book item"
    end
  end

  describe "update book_item" do
    setup [:create_book_item]

    test "redirects when data is valid", %{conn: conn, book_item: book_item} do
      conn = put(conn, Routes.book_item_path(conn, :update, book_item), book_item: @update_attrs)
      assert redirected_to(conn) == Routes.book_item_path(conn, :show, book_item)

      conn = get(conn, Routes.book_item_path(conn, :show, book_item))
      assert html_response(conn, 200) =~ "some updated book_items"
    end

    test "renders errors when data is invalid", %{conn: conn, book_item: book_item} do
      conn = put(conn, Routes.book_item_path(conn, :update, book_item), book_item: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Book item"
    end
  end

  describe "delete book_item" do
    setup [:create_book_item]

    test "deletes chosen book_item", %{conn: conn, book_item: book_item} do
      conn = delete(conn, Routes.book_item_path(conn, :delete, book_item))
      assert redirected_to(conn) == Routes.book_item_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.book_item_path(conn, :show, book_item))
      end
    end
  end

  defp create_book_item(_) do
    book_item = fixture(:book_item)
    {:ok, book_item: book_item}
  end
end

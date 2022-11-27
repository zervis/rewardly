defmodule RewardlyWeb.CreditControllerTest do
  use RewardlyWeb.ConnCase

  import Rewardly.CreditsFixtures

  @create_attrs %{amount: 42, user_id: 42}
  @update_attrs %{amount: 43, user_id: 43}
  @invalid_attrs %{amount: nil, user_id: nil}

  describe "index" do
    test "lists all credits", %{conn: conn} do
      conn = get(conn, Routes.credit_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Credits"
    end
  end

  describe "new credit" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.credit_path(conn, :new))
      assert html_response(conn, 200) =~ "New Credit"
    end
  end

  describe "create credit" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.credit_path(conn, :create), credit: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.credit_path(conn, :show, id)

      conn = get(conn, Routes.credit_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Credit"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.credit_path(conn, :create), credit: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Credit"
    end
  end

  describe "edit credit" do
    setup [:create_credit]

    test "renders form for editing chosen credit", %{conn: conn, credit: credit} do
      conn = get(conn, Routes.credit_path(conn, :edit, credit))
      assert html_response(conn, 200) =~ "Edit Credit"
    end
  end

  describe "update credit" do
    setup [:create_credit]

    test "redirects when data is valid", %{conn: conn, credit: credit} do
      conn = put(conn, Routes.credit_path(conn, :update, credit), credit: @update_attrs)
      assert redirected_to(conn) == Routes.credit_path(conn, :show, credit)

      conn = get(conn, Routes.credit_path(conn, :show, credit))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, credit: credit} do
      conn = put(conn, Routes.credit_path(conn, :update, credit), credit: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Credit"
    end
  end

  describe "delete credit" do
    setup [:create_credit]

    test "deletes chosen credit", %{conn: conn, credit: credit} do
      conn = delete(conn, Routes.credit_path(conn, :delete, credit))
      assert redirected_to(conn) == Routes.credit_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.credit_path(conn, :show, credit))
      end
    end
  end

  defp create_credit(_) do
    credit = credit_fixture()
    %{credit: credit}
  end
end

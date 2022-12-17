defmodule ExMon.Trainer.CreateTest do
  use ExMon.DataCase

  alias ExMon.{Repo, Trainer}
  alias Trainer.Create

  describe "call/1" do
    test "when all params are valid, creates a trainer" do
        params = %{name: "Pedro", password: "123456"}

        count_before = Repo.aggregate(Trainer, :count)

        response =  Create.call(params)

        count_after = Repo.aggregate(Trainer, :count)

        assert {:ok, %Trainer{name: "Pedro"}} = response
        assert count_after > count_before
    end

    test "when any params are invalid, returns an error" do
      params = %{name: "Pedro"}

      count_before = Repo.aggregate(Trainer, :count)

      response =  Create.call(params)

      count_after = Repo.aggregate(Trainer, :count)

      assert {:error, _changeset} = response
      assert count_after == count_before
  end
  end
end

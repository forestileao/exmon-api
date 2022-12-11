defmodule ExMon.TrainerTest do
  use ExMon.DataCase

  alias ExMon.Trainer

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = %{name: "Pedro", password: "123456"}

      response = Trainer.changeset(params)

      assert "pastel" == response
    end
  end
end

defmodule ExMon.GameTest do
  use ExUnit.Case

  alias ExMon.{Game, Player}

  describe "start/2" do
    test "starts the game state" do
      player = Player.build("Kayke", :chute, :soco, :cura)
      computer = Player.build("WALL-E", :kick, :puch, :heal)

      assert {:ok, _pid} = Game.start(computer, player)
    end
  end

  describe "info/0" do
    test "returns the current state game" do
      player = Player.build("Kayke", :chute, :soco, :cura)
      computer = Player.build("WALL-E", :kick, :puch, :heal)
      Game.start(computer, player)

      expected_return = %{
        status: :started,
        player: %ExMon.Player{
          life: 100,
          moves: %{move_heal: :cura, move_avg: :soco, move_rnd: :chute},
          name: "Kayke"
        },
        computer: %ExMon.Player{
          life: 100,
          moves: %{move_heal: :heal, move_avg: :puch, move_rnd: :kick},
          name: "WALL-E"
        },
        turn: :player
      }

      assert Game.info() === expected_return
    end
  end
end

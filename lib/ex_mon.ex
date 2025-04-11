defmodule ExMon do
  alias ExMon.{Game, Player}

  @computer_name "WALL-E"

  def create_player(name, move_avg, move_rnd, move_heal) do
    Player.build(name, move_avg, move_rnd, move_heal)
  end

  def start_game(player) do
    @computer_name
    |> create_player(:puch, :kick, :heal)
    |> Game.start(player)
  end
end

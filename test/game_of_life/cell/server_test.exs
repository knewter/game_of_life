defmodule GameOfLife.Cell.Server do
  use GenServer

  # Server API
  def start_link(cell) do
    GenServer.start_link(__MODULE__, cell)
  end

  def get_state(pid) do
    GenServer.call(pid, :get_state)
  end

  # Callbacks
  def handle_call(:get_state, _from, state) do
    {:reply, state, state}
  end
end

defmodule GameOfLife.Cell.ServerTest do
  use ExUnit.Case
  alias GameOfLife.Cell
  alias GameOfLife.Cell.Server

  test "can provide its current state" do
    cell = %Cell{x: 1, y: 2, alive: false}
    {:ok, pid} = Server.start_link(cell)
    assert Server.get_state(pid) == cell
  end
end

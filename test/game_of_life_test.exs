defmodule GameOfLife.Cell do
  @moduledoc """
  A Cell in the Game of Life board.  It can be either alive or dead.
  """

  defstruct alive: false

  @type t :: %__MODULE__{
    alive: boolean
  }

end

defmodule GameOfLife.Logic do
  alias GameOfLife.Cell

  @type neighbor_states :: list(boolean)

  @spec evaluate(Cell.t, neighbor_states) :: Cell.t
  def evaluate(cell, neighbor_states) when is_list(neighbor_states) do
    evaluate(cell, live_neighbor_count(neighbor_states))
  end

  @spec evaluate(Cell.t, number) :: Cell.t
  def evaluate(%Cell{alive: true}, 2), do: %Cell{alive: true}
  def evaluate(%Cell{}, 3), do: %Cell{alive: true}
  def evaluate(cell, live_neighbor_count) when is_number(live_neighbor_count) do
    %Cell{alive: false}
  end

  @spec live_neighbor_count(list(boolean)) :: number
  defp live_neighbor_count(neighbor_states) when is_list(neighbor_states) do
    Enum.count(neighbor_states, fn(state) -> state end)
  end
end

defmodule GameOfLifeTest do
  use ExUnit.Case
  doctest GameOfLife

  alias GameOfLife.Cell
  alias GameOfLife.Logic

  test "Any live cell with fewer than two live neighbours dies, as if caused by under-population." do
    cell = %Cell{alive: true}
    assert Logic.evaluate(cell, [false, false, false, false, false, false, false, false]) == %Cell{alive: false}
  end

  test "Any live cell with two or three live neighbours lives on to the next generation." do
    cell = %Cell{alive: true}
    assert Logic.evaluate(cell, [true, true, false, false, false, false, false, false]) == %Cell{alive: true}
    assert Logic.evaluate(cell, [true, true, true, false, false, false, false, false]) == %Cell{alive: true}
  end

  test "Any live cell with more than three live neighbours dies, as if by overcrowding." do
    cell = %Cell{alive: true}
    assert Logic.evaluate(cell, [true, true, true, true, false, false, false, false]) == %Cell{alive: false}
  end

  test "Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction." do
    cell = %Cell{alive: false}
    assert Logic.evaluate(cell, [true, true, true, false, false, false, false, false]) == %Cell{alive: true}
  end
end

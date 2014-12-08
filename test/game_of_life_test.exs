defmodule GameOfLife.Cell do
  @moduledoc """
  A Cell in the Game of Life board.  It can be either alive or dead.
  """

  defstruct alive: false

  @type t :: %__MODULE__{
    alive: boolean
  }

  defmodule Logic do
    alias GameOfLife.Cell

    @type neighbor_states :: list(boolean)

    @spec apply(Cell.t, neighbor_states) :: Cell.t
    def apply(cell, neighbor_states) do
      %Cell{alive: false}
    end
  end
end

defmodule GameOfLifeTest do
  use ExUnit.Case
  doctest GameOfLife
  alias GameOfLife.Cell
  alias GameOfLife.Cell.Logic

  test "Any live cell with fewer than two live neighbours dies, as if caused by under-population." do
    cell = %Cell{alive: true}
    assert Logic.apply(cell, [false, false, false, false, false, false, false, false]) == %Cell{alive: false}
  end
end

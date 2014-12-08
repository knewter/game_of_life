defmodule GameOfLife.Cell do
  @moduledoc """
  A Cell in the Game of Life board.  It can be either alive or dead.
  """

  @derive [Access]
  defstruct alive: false, x: nil, y: nil, t: 0

  @type t :: %__MODULE__{
    alive: boolean
  }

  @spec neighbors(t) :: list(tuple(number, number))
  def neighbors(%__MODULE__{x: x, y: y}) do
    (for x <- (x-1..x+1), y <- (y-1..y+1), do: {x, y}) |> List.delete({x, y})
  end
end

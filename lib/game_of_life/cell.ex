defmodule GameOfLife.Cell do
  @moduledoc """
  A Cell in the Game of Life board.  It can be either alive or dead.
  """

  defstruct alive: false

  @type t :: %__MODULE__{
    alive: boolean
  }
end

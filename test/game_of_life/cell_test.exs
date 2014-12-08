defmodule GameOfLife.CellTest do
  use ExUnit.Case

  alias GameOfLife.Cell

  test "A cell has an x, y, t, and alive status" do
    cell = %Cell{alive: false, x: 0, y: 0, t: 0}
    assert cell.alive == false
    assert cell.x == 0
    assert cell.y == 0
    assert cell.t == 0
  end

  test "Finding a cell's neighbor coordinates" do
    cell = %Cell{x: 1, y: 1}
    neighbors = [
      {0, 0},
      {0, 1},
      {0, 2},
      {1, 0},
      {1, 2},
      {2, 0},
      {2, 1},
      {2, 2}
    ]
    assert Cell.neighbors(cell) == neighbors
  end
end

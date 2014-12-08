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

defmodule GameOfLife.BoardTest do
  use ExUnit.Case

  test "creates a child process for each cell in the initial template" do
    board = Board.start_link(template)
    assert 8 == Supervisor.count_children(board)
  end
end

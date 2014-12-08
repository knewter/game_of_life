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

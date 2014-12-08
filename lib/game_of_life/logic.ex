defmodule GameOfLife.Logic do
  alias GameOfLife.Cell

  @type neighbor_states :: list(boolean)

  @spec next_cell(Cell.t, neighbor_states) :: Cell.t
  def next_cell(cell, neighbor_states) when is_list(neighbor_states) do
    do_next_cell(cell, live_neighbor_count(neighbor_states))
    |> update_in([:t], &(&1+1))
  end

  @spec do_next_cell(Cell.t, number) :: Cell.t
  defp do_next_cell(cell=%Cell{alive: true}, 2), do: %Cell{cell | alive: true}
  defp do_next_cell(cell=%Cell{}, 3), do: %Cell{cell | alive: true}
  defp do_next_cell(cell, live_neighbor_count) when is_number(live_neighbor_count) do
    %Cell{cell | alive: false}
  end

  @spec live_neighbor_count(list(boolean)) :: number
  defp live_neighbor_count(neighbor_states) when is_list(neighbor_states) do
    Enum.count(neighbor_states, fn(state) -> state end)
  end
end

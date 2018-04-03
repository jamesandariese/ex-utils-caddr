defmodule Caddr do
  @moduledoc """
  Documentation for Caddr.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Caddr.uniqc([1,2,3,1,2,3,1,2,4])
      %{1 => 3, 2 => 3, 3 => 2, 4 => 1} 

  """

  def uniqc(e) do
    Enum.group_by(e, fn x -> x end)
    |> Map.to_list
    |> Enum.map(fn {x, y} -> {x, Enum.count(y)} end)
    |> Map.new
  end
end

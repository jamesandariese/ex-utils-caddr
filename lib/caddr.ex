defmodule Caddr do
  @moduledoc """
  Documentation for Caddr.
  """

  @doc """
  Uniq -c

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


  @doc """
  ## Examples
      iex> Caddr.reduce_groups([{1,2,3,5}, {1,2,1,5}, {1,1,1,5}], {0, 1}, [{&Enum.sum/1, 2}, {&Enum.sum/1, 3}])
      %{{1, 2} => {4, 10}, {1, 1} => {1, 5}}
  """
  def reduce_groups(e, gb, aggs) do
    e
    |> Enum.group_by(&(select_from_tuple(&1, gb)))
    |> Map.to_list
    |> Enum.map(fn {g, n} ->
      {g, aggregate_tuple(n, aggs)}
    end)
    |> Map.new
  end

  @doc """
  Aggregate tuple
  ## Examples
      iex> Caddr.aggregate_tuple([{1,2,3}, {3,4,5}], [{&Enum.sum/1, 2}, {&Enum.count/1, 0}])
      {8, 2}
  """
  def aggregate_tuple(_, []), do: {}
  def aggregate_tuple(e, [{agg, aggn}| r]) do
    Tuple.insert_at(aggregate_tuple(e, r), 0,
      e |> Enum.map(&(elem(&1, aggn))) |> agg.()
    )
  end

  @doc """
  ## Examples
      iex> Caddr.select_from_tuple({1,2,3,4,5}, {3,2})
      {4, 3}
  """
  def select_from_tuple(t, el) do
    Tuple.to_list(el)
    |> Enum.reduce({}, fn y,x -> Tuple.append(x, elem(t, y)) end)
  end
end

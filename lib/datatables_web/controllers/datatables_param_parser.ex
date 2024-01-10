

defmodule DatatablesWeb.DatatablesParamParser do
  # import Ecto.Query
  alias Datatables.Repo
  alias Datatables.Zips.Zip

  def build_paging_info(params) do
    IO.inspect(params["length"], label: "========== Length parameter in build_paging_info ============")
    IO.inspect(params["start"], label: "========== Start parameter in build_paging_info ============")
    IO.inspect(params["search"], label: "========== Search parameter in build_paging_info ============")
    IO.inspect(params["draw"], label: "========== draw parameter in build_paging_info ============")

    page_size = calculate_page_size(params["length"], total_entries_from_database())
    page_number = calculate_page_number(params["start"], page_size)
    search_term = params["search"]["value"]
    draw_number = increment_draw(params["draw"])
    {page_size, page_number, draw_number, search_term}
  end

  defp increment_draw(value) when value == nil, do: 1
  defp increment_draw(value) do
    {draw_number, _} = Integer.parse(value)
    draw_number + 1
  end

  defp calculate_page_number(nil, _), do: 1
  defp calculate_page_number(value, page_size) do
    {start_value, _} = Integer.parse(value)
    round(start_value / page_size + 1)
  end

  defp calculate_page_size(nil, total_entries) do
    total_entries
  end

  defp calculate_page_size(value, _total_entries) do
    {page_size, _} = Integer.parse(value)
    page_size
  end

  defp total_entries_from_database, do: Repo.aggregate(Zip, :count, :id)
end

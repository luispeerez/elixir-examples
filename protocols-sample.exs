defprotocol Size do
	@doc "Calculates the size and not the length of a data structure"
	def size(data)
end

defimpl Size, for: BitString do
	def size(string), do: byte_size(string)
end

defimpl Size, for: Map do
	def size(map), do: map_size(map)
end

defimpl Size, for: Tuple do
	def size(tuple), do: tuple_size(tuple)
end

defimpl Size, for: Any do
	def size(_), do: 0
end

IO.puts Size.size("foo")
IO.puts Size.size(%{label: "some label"})
IO.puts Size.size({:ok, "hello"})
IO.puts Size.size([1,2,3])

defmodule OtherUser do
	@derive[Size]
	defstruct [:name, :age]
end

defprotocol Size do
	@fallback_to_any true
	def size(data)
end
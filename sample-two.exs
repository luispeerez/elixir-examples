#@spec round(number) :: integer
#def round(number), do: # implementation...

defmodule LousyCalculator do
	@typedoc """
	Just a number followed by a string
	"""
	@type number_with_remark :: number_with_remark

	#What receives the function and what it returs
	@spec add(number, number) :: {number, String.t}
	def add(x,y), do: {x+y, "You need a calculator to do that?"}

	@spec multiply(number, number) :: {number, String.t}
	def multiply(x,y), do: {x*y, "Jeez come on!"}

	@spec addV2(number, number) :: number_with_remark
	def addV2(x,y), do: {x+y, "This is part of the type number_with_remark"}
end 

IO.inspect LousyCalculator.addV2(4,2)

#Behaviour

defmodule Parser do
	#term means Any type
	@callback parse(String.t) :: {:ok, term} | {:error, String.t}
	@callback extensions() :: [String.t]
end

#Adopting the behaviour
defmodule JSONParser do
	@behaviour Parser

	def parse(str), do: {:ok, "TODO: this will be a json"}
	def extensions, do: ["json"]

	def parse!(implementation, contents) do
		case implementation.parse(contents) do
			{:ok, data} -> data
			{:error, error} -> raise ArgumentError, "parsing error #{error}"
		end
	end
end

defmodule YAMLParser do
	@behaviour Parser

	def parse(str), do: {:ok, "TODO this will be a YAML"}
	def extensions, do: ["yml"]
end

res = YAMLParser.parse("entrada")
IO.inspect res

res2 = JSONParser.parse("segundaentrada")
IO.inspect res2
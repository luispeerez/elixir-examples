defmodule CustomMath do
	def sum(a,b) do
		a + b
	end

	defp private_sum(a,b) do
		a + b
	end

	def zero?(0) do
		true
	end

	def zero?(x) when is_integer(x) do
		false
	end

	#One line function defs
	@doc """
  def zero?(0), do: true
  def zero?(x) when is_integer(x), do: false	
	"""

end


IO.puts CustomMath.sum(1,3)
#IO.puts CustomMath.private_sum(1,3)

IO.puts CustomMath.zero?(0)         #=> true
IO.puts CustomMath.zero?(1)         #=> false
#IO.puts CustomMath.zero?([1, 2, 3]) #=> ** (FunctionClauseError)
#IO.puts CustomMath.zero?(0.0)       #=> ** (FunctionClauseError)

myFun = &CustomMath.zero?/1
#IO.puts "myFun is a function? " <> is_function(myFun)
IO.puts is_function(myFun)
IO.puts myFun.(0)

#Capturing the is_function function LOL
IO.puts (&is_function/1).(myFun)

#Shortcut for creating other functions
#The &1 represents the first argument passed into the function. 
#&(&1+1) above is exactly the same as fn x -> x + 1 end
otherFn = &(&1 + 1)
IO.puts otherFn.(8)

#Default values
defmodule DefaultTest do
	def doWork(x \\ "doingDefaultWork") do
		x
	end
end

IO.puts DefaultTest.doWork()
IO.puts DefaultTest.doWork "special job"

#If a function with default values has multiple clauses, 
#it is required to create a function head (without an actual body) for declaring defaults:

defmodule MyConcat do
	
	def join(a, b\\nil, sep\\" ") #Personal note: A kind of an interface
		
	def join(a, b, _sep) when is_nil(b) do
		a
	end

	def join(a,b,sep) do
		a <> sep <> b
	end

end

IO.puts MyConcat.join("Hola", "mundo")
IO.puts MyConcat.join("Hola")
IO.puts MyConcat.join("Hola", "mundo", "__")

#Instead of for cycles, elixir uses recursion
defmodule MyRecursion do

	def print_multiple_times(msg, n) when n <= 1 do
		IO.puts msg
	end

	def print_multiple_times(msg, n) do
		IO.puts msg
		print_multiple_times(msg, n-1)
	end

end

nTimes = 3
MyRecursion.print_multiple_times("Esto se imprimira", nTimes)

#Reducing
#the first tail is [2,3]
defmodule MyTools do
	
	#REDUCING
	def myReducer([head | tail], accumulator) do
		myReducer(tail, head + accumulator)
	end

	def myReducer([], accumulator) do 
		accumulator
	end

	#MAPPING
	def double_each([head | tail]) do
		[head * 2 | double_each(tail)]
	end

	def double_each([]) do
		[]
	end

end

IO.puts MyTools.myReducer([1,2,3], 0) #=>6

mappedList = MyTools.double_each([1, 2, 3]) #=> [2, 4, 6]
IO.inspect mappedList

#Shortcuts for reducing and mapping

reducedValue = Enum.reduce([1,2,3], 0, fn(x, acum) -> x + acum end)
IO.puts reducedValue

otherMappedList = Enum.map([1,2,3], fn(x) -> x*2 end)
IO.inspect otherMappedList

#shortcut of the shortcut

reducedValue2 = Enum.reduce([1,2,3], 0,  &+/2 )
IO.puts reducedValue2

mappedList2 = Enum.map([1,2,3], &(&1*2))
IO.inspect mappedList2

odd? = &(rem(&1, 2) != 0)

#The example above has a pipeline of operations. 
#We start with a range and then multiply each element in the range by 3. 
#This first operation will now create and return a list with 100_000 items. 
#Then we keep all odd elements from the list, generating a new list,
#now with 50_000 items, and then we sum all entries.
valueFromPipeOperation = 1..100_000 |> Enum.map(&(&1*3)) |> Enum.filter(odd?) |> Enum.sum 
IO.puts valueFromPipeOperation

myStream = 1..100_000 |> Stream.map(&(&1 * 3)) |> Stream.filter(odd?)
IO.inspect myStream

myOtherStream = File.stream!("text-sample.txt")
IO.puts Enum.take(myOtherStream, 5)

#PROCESOS
pid = spawn fn -> 1 + 2 end
IO.inspect pid
IO.puts Process.alive?(pid)


IO.inspect self()
IO.puts Process.alive?(self())


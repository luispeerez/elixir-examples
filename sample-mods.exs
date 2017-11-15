# Alias the module so it can be called as Bar instead of Foo.Bar
#alias Foo.Bar, as: Bar

# Require the module in order to use its macros
#require Foo

# Import functions from Foo so they can be called without the `Foo.` prefix
#import Foo

# Invokes the custom code defined in Foo as an extension point
#use Foo

defmodule Stats do
	alias Math.List, as: List

	#n fact, calling alias without an :as option 
	#sets the alias automatically to the last part of the module name
	#this is the same:#
	#alias Math.List
	#alias Math.List, as: List
end

require Integer
Integer.is_odd(3)

#In this case, we are importing only the function duplicate (with arity 2) from List
#:except could also be given as an option in order to import everything in a module except a list of functions.
import List, only: [duplicate: 2]
result = duplicate(:ok, 3)
IO.inspect result

# For example, imagine you have an application where all modules are nested under MyApp,
#you can alias the modules MyApp.Foo, MyApp.Bar and MyApp.Baz at once as follows:
#alias MyApp.{Foo, Bar, Baz}

defmodule MyServer do
	@vsn 2

	#As constants
	@initial_state %{host: "127.0.0.1", port: 3456}

	@my_data 14
	def first_data, do: @my_data
	@my_data 13
	def second_data, do: @my_data
	def initial_state, do: @initial_state

end 

defmodule SampleMath do
	@moduledoc """
	
	## Examples
		iex> Math.sum(1,2)
		3

	"""

	@doc """
	Calculates the sum of two numbers
	"""
	def sum(a,b), do: a+b 
end

IO.puts MyServer.first_data
IO.puts MyServer.second_data
IO.inspect MyServer.initial_state

#defmodule MyPlug do
	#use Plug.Builder

	#plug :set_header
	#plug :send_ok

	#def set_header(conn, _opts) do
	#	put_resp_header(conn, "x-header", "set")
	#end

	#def send_ok(conn, _opts) do
	#	send(conn, 200, "ok")
	#end
#end

#IO.puts "Running MyPlug with Cowboy on http://localhost:4000"
##Plug.Adapters.Cowboy.http(MyPlug, [])


defmodule User do
	defstruct name: "John", age: 27
end

defmodule Product do
	#name will be nil
	defstruct [:name]
end

defmodule Car do
	@enforce_keys [:make]
	defstruct [:model, :make]
end

defmodule SampleModule do 
	def main do
		sampleUser = %User{name: "Andres", age: 31}
		IO.inspect sampleUser

		sampleProduct = %Product{}
		IO.inspect sampleProduct

		sampleCar = %Car{}
		IO.inspect sampleCar
	end
end


SampleModule.main()
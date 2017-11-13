send self(), {:hellos, "world"} 

receive do
	{:hello, msg} -> IO.puts msg
	{:world, msg} -> IO.puts "wont match"
after 
	1_000 -> IO.puts "nothing after 1s"
end


parent = self()
spawn fn -> send(parent, {:hello, self()}) end

receive do 
	{:hello, pid} -> IO.puts "Got hello from #{inspect pid}"
end


spawn fn -> 
	IO.puts "oops"
	raise "oops" 
end

startedTask = Task.start fn -> 
	IO.puts "inicio con Task.start"
	raise "oops" 
end

IO.inspect startedTask
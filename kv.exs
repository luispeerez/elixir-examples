#We can write processes that loop infinitely, maintain state, and send and receive messages.
defmodule KV do
	def start_link do
		Task.start_link(fn-> loop(%{}) end)
	end

	def loop(map) do
		receive do
			{:get, key, caller} ->
				send caller, Map.get(map, key)
				IO.inspect Map.get(map, key)
				loop(map)
			{:put, key, value} ->
				loop(Map.put(map,key, value))
				IO.inspect map
		end
	end

end

#Note that the start_link function starts a new process that runs the loop/1 function, 
#starting with an empty map. 
#The loop/1 function then waits for messages and performs the appropriate action for each message. 
#In the case of a :get message, it sends a message back to the caller and calls loop/1 again, 
#to wait for a new message. While the :put message actually invokes loop/1 with a new version of the map, 
#with the given key and value stored.

{:ok, pid} = KV.start_link
send(pid, {:get, :hello, self()})

send(pid, {:put, :hello, :world})


registered = Process.register(pid, :kv)
IO.inspect registered

send :kv, {:get, :hello, self()}

#Agent can do abstractions around state
{:ok, otherPid} = Agent.start_link(fn -> %{} end)
IO.inspect otherPid

updateFn = fn map -> 
	Map.put(map, :hello, :world)  	
	#newMap = Map.put(map, :hello, :world)  
  #IO.inspect newMap
end

getFn = fn map -> 
	Map.get(map, :hello)
	#IO.inspect 	Map.get(map, :hello)
end

Agent.update(otherPid, updateFn )
Agent.get(pid, getFn)

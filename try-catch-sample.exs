#aSample = :foo + 1
#IO.puts aSample

#raise ArgumentError, message: "invalid argument foo"

defmodule MyError do
	defexception message: "a custom error msg"
end

#raise MyError

try do
	IO.puts "everything ok"
	#raise "oops"
rescue
	e in Runtime -> e
end

case File.read "hello" do
	{:ok, body} -> IO.puts "Success: #{body}"
	{:error, reason} -> IO.puts "Error #{reason}"
end

#spawn_link fn -> exit(1) end
try do
	exit "i am existing"
catch
	:exit, _ -> "not really"
end
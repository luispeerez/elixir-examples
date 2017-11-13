#IO.gets "yes or no? "

IO.puts :stderr, "hello world"

{:ok, file} = File.open("hello", [:write])

IO.binwrite file, "world"
File.close file
IO.inspect File.read "hello"


#Notice that the version with ! returns the contents of the file instead of a tuple, 
#and if anything goes wrong the function raises an error.

IO.inspect File.read "hello"
IO.inspect File.read! "hello"

#IO.inspect File.read "unknown"
#IO.inspect File.read! "unknown"

file = "hellos"
case File.read(file) do
	{:ok, body} -> IO.puts "Reading file content"
	{:error, reason} -> IO.puts "Error caused by #{reason}" 
end

#Path module takes care of different operating systems transparently
samplePath = Path.join("foo", "bar")
IO.puts samplePath

expandedPath = Path.expand("~/hello")
IO.puts expandedPath
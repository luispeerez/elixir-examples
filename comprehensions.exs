results = for n <- [1,2,3,4], do: n*n
IO.inspect results

values = [good: 1, good: 2, bad: 3, good: 4]

squaredValues = for {:good, n} <- values, do: n*n
IO.inspect squaredValues

multiple_of_3? = fn(n) -> 
	rem(n, 3) === 0 
end

squareValueFormMultiplesOf3 = for n <- 0..5, multiple_of_3?.(n), do: n*n
IO.inspect squareValueFormMultiplesOf3

#using multiple generators and filters
#dirs = ['/home/mikey', '/home/james']

#for dir <- dirs,
#		file <- File.ls!(dir),
#		path = Path.join(dir, file),
#		File.regular?(path) do
#	File.stat!(path).size
#end

#Multiple generators can also be used to calculate the cartesian product of two lists:
cartesianProducts = for i <- [:a, :b, :c], j <- [1,2], do: {i, j}
IO.inspect cartesianProducts

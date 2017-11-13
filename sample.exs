IO.puts "Hello world from elixir"

#:world is an atom ( An atom is a constant whose name is its own value)
IO.puts "Hello #{:world}"

IO.puts String.length("hello")

addTwoNumbers = fn a,b -> a + b end

IO.puts is_function(addTwoNumbers)

IO.puts is_function(addTwoNumbers, 2)# check if add is a function that expects exactly 2 arguments
IO.puts is_function(addTwoNumbers, 1)# check if add is a function that expects exactly 1 arguments


#Note that a dot (.) between the variable and parentheses is required to invoke an anonymous function. 
#The dot ensures there is no ambiguity between calling an anonymous function named add and a named function add/2. 
#In this sense, Elixir makes a clear distinction between anonymous functions and named function
IO.puts addTwoNumbers.(4,3)


doubleNumber = fn a -> addTwoNumbers.(a,a) end
IO.puts doubleNumber.(3) 


myList = [1,2,true,3]
IO.puts length myList

listConcat = myList ++ [4,5,6]

#List operators never modify the existing list
listSubstract = myList -- [true,6]

anotherList = [6,7,8,9]

#Head of the list (first element)
hd(anotherList)

#Tail last element of the list
tl(anotherList)


#Single quotes are charlists, double quotes are strings.
'hello' === "hello" #is not equal


#Pattern matching
#{a,b,c} = {:firstAtom, :secondAtom, :thirdAtom}

myFn = fn
	x,y when x > 0 -> x+y
	x,y -> x*y
end

IO.puts myFn.(1,3)
IO.puts myFn.(-1,3)

cond do
	2 + 2 === 5 ->
	 IO.puts "No es verdadero"
	2 * 3 === 3 ->
	 IO.puts "Esto tampoco"

	1 + 1 === 2 ->
	 IO.puts "Esto es verdadero"
end


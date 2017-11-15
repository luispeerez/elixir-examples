# ~r for regular expressions
regex = ~r/foo|bar/
satisfiesRegex = "foo" =~ regex
satisfiesRegex2 = "bat" =~ regex

IO.inspect satisfiesRegex
IO.inspect satisfiesRegex2

caseSensitiveRegex = ~r/hello/
satisfiesRegex3 = "HELLO" =~ caseSensitiveRegex
IO.puts satisfiesRegex3

caseInsensitiveRegex = ~r/hello/i
satisfiesRegex4 = "HELLO" =~ caseInsensitiveRegex
IO.puts satisfiesRegex4

stringSigileExample = ~s(this is a string with "double" quotes, not 'single' ones)
IO.puts stringSigileExample

stringSigileExample2 = ~s(String with escape codes \x26 #{"inter" <> "polation"})
IO.puts stringSigileExample2

stringSigileExample3 =  ~S(String without escape codes \x26 without #{interpolation})
IO.puts stringSigileExample3
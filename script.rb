#!/usr/bin/env ruby
# require ('rspec')
require ('./lib/template')

resume = true
while (resume)
  puts("Get you prime, bro xanaxxx")
  input = gets.chomp
  prime1 = Primer.new(input.to_i)

  puts(prime1.function_dude)
  puts("Would you like to do this again sometime? Y/N")
  doResume = gets.chomp
  if doResume == "Y" || doResume == "y"
    resume = true
  else
    resume = false
  end
end

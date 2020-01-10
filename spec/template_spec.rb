require ('pry')
require ('rspec')
require ('template')




# PLUMBED WITHOUT INSTANCE VARIABLES
# describe("Change#find_change") do
#   it ("returns 8") do
#     dude1 = Dude.new()
#     expect(dude1.function_dude(5,3)).to(eq(24))
#   end
# end

# PLUMBED WITH INSTANCES
describe("Change#find_change") do
  it ("returns 8") do
    dude1 = Dude.new(5,3)
    expect(dude1.function_dude()).to(eq(24))
  end
end

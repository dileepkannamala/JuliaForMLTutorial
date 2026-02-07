# IdDict example in Julia
# Demonstrates how keys are compared by identity (===) instead of equality (==)

# Create two separate arrays with the same contents
a = [1, 2, 3]
b = [1, 2, 3]  # Different object, same values as 'a'

# Create an IdDict and add entries
id_dict = IdDict()
id_dict[a] = "First array"
id_dict[b] = "Second array"

# Create a normal Dict for comparison
normal_dict = Dict()
normal_dict[a] = "First array"
normal_dict[b] = "Second array"

# Display results
println("IdDict contents:")
for (k, v) in id_dict
    println("Key objectid: ", objectid(k), " => ", v)
end

println("\nNormal Dict contents:")
for (k, v) in normal_dict
    println("Key: ", k, " => ", v)
end

# Demonstrate lookup
println("\nIdDict lookup with 'a': ", id_dict[a])
println("IdDict lookup with 'b': ", id_dict[b])
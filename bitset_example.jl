# Create a BitSet with some integers
bs = BitSet([1, 3, 5, 7])

println("Initial BitSet: ", bs)

# Add an element
push!(bs, 9)
println("After adding 9: ", bs)

# Remove an element
delete!(bs, 3)
println("After removing 3: ", bs)

# Check membership
println("Contains 5? ", 5 in bs)
println("Contains 3? ", 3 in bs)

# Iterate over elements
println("Elements in BitSet:")
for x in bs
    println(x)
end

# Set operations
bs2 = BitSet([5, 7, 9, 11])
println("Union: ", union(bs, bs2))
println("Intersection: ", intersect(bs, bs2))
println("Difference: ", setdiff(bs, bs2))
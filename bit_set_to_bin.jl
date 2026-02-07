# Function to convert BitSet to a binary string
function bitset_to_binary(bs::BitSet)
    if isempty(bs)
        return "0"
    end
    maxbit = maximum(bs)  # highest set bit index
    bits = [in(i, bs) ? '1' : '0' for i in 0:maxbit]  # BitSet is 0-based
    return join(reverse(bits))  # reverse so highest bit is leftmost
end

# Example usage
bs = BitSet([0, 2, 4])  # bits 0, 2, and 4 are set
println("BitSet: ", bs)
println("Binary pattern: ", bitset_to_binary(bs))

function bitset_mask(bs::BitSet)
    mask = 0
    for b in bs
        mask |= 1 << b
    end
    return mask
end

bs = BitSet([0, 2, 4])
mask = bitset_mask(bs)
println("Mask: ", mask)
println("Binary: ", bitstring(mask))
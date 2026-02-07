# ============================================
# Control Structures in Julia - Full Example
# ============================================

println("=== 1. Conditional Statements ===")

x = 10

# if - elseif - else
if x > 0
    println("x is positive")
elseif x == 0
    println("x is zero")
else
    println("x is negative")
end

# Ternary operator
result = x > 0 ? "Positive" : "Non-positive"
println("Ternary result: $result")

# Short-circuit evaluation
(a = 5) > 0 && println("a is positive")
(b = -3) < 0 || println("b is not negative")  # Will not print because b < 0 is true

println("\n=== 2. Loops ===")

# while loop
count = 0
while count <= 3
    global count
    println("While loop count: $count")
    count += 1
end

# for loop over a range
for i in 1:3
    println("For loop range value: $i")
end

# for loop over an array
fruits = ["apple", "banana", "cherry"]
for fruit in fruits
    println("Fruit: $fruit")
end

# Nested loops
for i in 1:2, j in 1:2
    println("Nested loop: i=$i, j=$j")
end

# Loop control: break and continue
for i in 1:6
    if i == 4
        println("Breaking at i=$i")
        break
    elseif i % 2 == 0
        println("Skipping even number: $i")
        continue
    end
    println("Processing i=$i")
end

println("\n=== 3. Exception Handling ===")

try
    println("Attempting division by zero...")
    println(10 / 0)  # Will cause an error
catch e
    println("Caught error: ", e)
finally
    println("Finally block always runs")
end

println("\n=== 4. Compound Expressions ===")

begin
    x = 2
    y = 3
    println("Sum inside begin-end block: ", x + y)
end

println("\n=== Script Finished ===")

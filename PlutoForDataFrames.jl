### A Pluto.jl notebook ###
# v0.20.21

using Markdown
using InteractiveUtils

# ╔═╡ d0b20b05-2fc7-4944-b4f8-486ee63fcd7c
md"""
# Based on search results and public presentations, the primary developer of Pluto.jl is **Fons van der Plas** (@fonsp), often working in collaboration with Mikołaj Bochenski and other community contributors.

![Fons van der Plas](https://avatars.githubusercontent.com/u/6933510?v=4)
"""

# ╔═╡ 669ad47e-0386-11f1-b41a-6de9fc94c5d5
md"""
```julia
# Install required packages (run once in Julia REPL)
# using Pkg
# Pkg.add(["DataFrames", "GLM", "Statistics", "Random"])

using DataFrames
using GLM
using Statistics
using Random

# Set random seed for reproducibility
Random.seed!(42)

# -----------------------------
# 1. Generate synthetic dataset
# -----------------------------
n = 100
x = rand(n) .* 10  # Feature values between 0 and 10
y = 3.5 .* x .+ 7 .+ randn(n) .* 2  # y = 3.5x + 7 + noise

# Create DataFrame
df = DataFrame(x = x, y = y)

# -----------------------------
# 2. Fit linear regression model
# -----------------------------
model = lm(@formula(y ~ x), df)

# -----------------------------
# 3. Display results
# -----------------------------
println("Model Summary:")
display(coeftable(model))

# -----------------------------
# 4. Make predictions
# -----------------------------
new_data = DataFrame(x = [2.0, 5.0, 8.0])
predictions = predict(model, new_data)
println("\nPredictions for x = 2, 5, 8:")
println(predictions)

# -----------------------------
# 5. Evaluate model (R²)
# -----------------------------
y_pred = predict(model, df)
ss_total = sum((y .- mean(y)).^2)
ss_res = sum((y .- y_pred).^2)
r2 = 1 - (ss_res / ss_total)
println("\nR² Score: ", round(r2, digits=4))
```
"""

# ╔═╡ 97d32da3-ecbc-4a7a-aee3-8dd876da6ecc
md"""
# Simple Linear Regression Model 
```julia
# Install Flux if not already installed
using Pkg
Pkg.add("Flux")

# Import Flux
using Flux

# -----------------------------
# 1. Generate synthetic data
# -----------------------------
# y = 3x + 2 + noise
x_data = collect(0:0.1:10)                # Input values
y_data = 3 .* x_data .+ 2 .+ 0.5 .* randn(length(x_data))  # Output with noise

# Convert to tensors (Flux works with arrays of Float32)
x_train = reshape(Float32.(x_data), 1, :)
y_train = reshape(Float32.(y_data), 1, :)

# -----------------------------
# 2. Define the model
# -----------------------------
model = Chain(
    Dense(1, 1)  # Single neuron for linear regression
)

# -----------------------------
# 3. Define loss function
# -----------------------------
loss_fn(x, y) = Flux.Losses.mse(model(x), y)

# -----------------------------
# 4. Choose optimizer
# -----------------------------
opt = Descent(0.01)  # Simple gradient descent

# -----------------------------
# 5. Train the model
# -----------------------------
println("Training...")
for epoch in 1:200
    Flux.train!(loss_fn, params(model), [(x_train, y_train)], opt)
    if epoch % 50 == 0
        println("Epoch $epoch - Loss: ", loss_fn(x_train, y_train))
    end
end

# -----------------------------
# 6. Test the model
# -----------------------------
println("\nLearned weight and bias:")
println(model[1].weight, " ", model[1].bias)

# Predict for a new value
x_new = Float32[4.0]
y_pred = model(reshape(x_new, 1, :))
println("Prediction for x=4: ", y_pred[1])

```
"""

# ╔═╡ 7b4c0dd9-4442-407f-bdd1-5a3036292ff2
md"""
# GLM Example

```julia

using GLM
# Sample data
data = DataFrame(
    x = [1200, 1800, 2500, 3000, 3800],
    y = [200000, 300000, 420000, 500000, 650000]
)

# Display the DataFrame
println(data)

# Fit the model
model = lm(@formula(y ~ x), data)

# Print the model summary
println(summary(model))

# Create a DataFrame for new data
new_data = DataFrame(x = [4500])

# Make predictions
predictions = predict(model, new_data)

# Print the predictions
println("Predicted price: ", predictions)

# Create a scatter plot of the data
scatter(data.x, data.y, label="Data")

# Plot the regression line
plot!(data.x, predict(model, data), label="Regression Line")

# Add labels and title
xlabel!("House Size (sq ft)")
ylabel!("House Price")
title!("Linear Regression Model")

# Display the plot
display(plot())

```

"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.12.4"
manifest_format = "2.0"
project_hash = "71853c6197a6a7f222db0f1978c7cb232b87c5ee"

[deps]
"""

# ╔═╡ Cell order:
# ╠═d0b20b05-2fc7-4944-b4f8-486ee63fcd7c
# ╟─669ad47e-0386-11f1-b41a-6de9fc94c5d5
# ╟─97d32da3-ecbc-4a7a-aee3-8dd876da6ecc
# ╟─7b4c0dd9-4442-407f-bdd1-5a3036292ff2
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002

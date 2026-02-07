using Pkg
Pkg.add(["Flux", "Plots", "Statistics", "MLJ", "MLJLinearModels"])
using Random
using Flux
using Plots
using Statistics
using MLJ
using MLJLinearModels
gr() # Use GR backend for plots

# Set random seed for reproducibility
Random.seed!(123)

# 1. Generate Synthetic Data for Linear Regression
println("Generating synthetic data...")
x_train = collect(1.0:0.1:10.0)'  # Transpose to make it a row vector
y_train = 2.0 .* x_train .+ 3.0 .+ 0.5 .* randn(size(x_train))  # y = 2x + 3 + noise

# Create test data
x_test = collect(10.1:0.1:15.0)'
y_test = 2.0 .* x_test .+ 3.0 .+ 0.5 .* randn(size(x_test))

# 2. Linear Regression with Flux
println("\n=== Linear Regression with Flux ===")

# Define model
model = Dense(1 => 1)  # Linear model: y = Wx + b

# Define loss function and optimizer
loss(m, x, y) = Flux.mse(m(x), y)
opt_state = Flux.setup(Adam(0.01), model)

# Training loop
println("Starting training...")
epochs = 500
loss_history = Float64[]

for epoch in 1:epochs
    # Calculate gradients and update parameters
    gs = Flux.gradient(m -> loss(m, x_train, y_train), model)
    Flux.update!(opt_state, model, gs[1])
    
    # Track loss
    if epoch % 50 == 0
        current_loss = loss(model, x_train, y_train)
        push!(loss_history, current_loss)
        println("Epoch $epoch: Loss = $current_loss")
    end
end

# Evaluate on test set
test_loss = loss(model, x_test, y_test)
println("Test Loss: $test_loss")

# 3. Generate Non-linear Data for Neural Network
println("\n=== Non-linear Function Approximation ===")

# Generate non-linear data: y = sin(x) + 0.1*x^2 + noise
x_nonlin = collect(-2.0:0.1:2.0)'
y_nonlin = sin.(x_nonlin) .+ 0.1 .* x_nonlin.^2 .+ 0.1 .* randn(size(x_nonlin))

# Split into train/test
n = size(x_nonlin, 2)
train_idx = 1:floor(Int, 0.8*n)
test_idx = (floor(Int, 0.8*n)+1):n

x_train_nonlin = x_nonlin[:, train_idx]
y_train_nonlin = y_nonlin[:, train_idx]
x_test_nonlin = x_nonlin[:, test_idx]
y_test_nonlin = y_nonlin[:, test_idx]

# Define a multi-layer neural network
nn_model = Chain(
    Dense(1, 10, relu),   # Hidden layer with 10 neurons and ReLU activation
    Dense(10, 1)          # Output layer
)

# Define loss and optimizer
nn_loss(m, x, y) = Flux.mse(m(x), y)
nn_opt_state = Flux.setup(Adam(0.01), nn_model)

# Training loop
println("Training neural network...")
nn_epochs = 1000
nn_loss_history = Float64[]

for epoch in 1:nn_epochs
    gs = Flux.gradient(m -> nn_loss(m, x_train_nonlin, y_train_nonlin), nn_model)
    Flux.update!(nn_opt_state, nn_model, gs[1])
    
    if epoch % 100 == 0
        current_loss = nn_loss(nn_model, x_train_nonlin, y_train_nonlin)
        push!(nn_loss_history, current_loss)
        println("Epoch $epoch: Loss = $current_loss")
    end
end

# Evaluate neural network
nn_test_loss = nn_loss(nn_model, x_test_nonlin, y_test_nonlin)
println("Neural Network Test Loss: $nn_test_loss")

# 4. Classification Example
println("\n=== Binary Classification ===")

# Generate 2D classification data
n_points = 200
x1_class1 = randn(n_points÷2) .+ 2
x2_class1 = randn(n_points÷2) .+ 2
x1_class2 = randn(n_points÷2) .- 2
x2_class2 = randn(n_points÷2) .- 2

# Combine data
X_class = vcat(hcat(x1_class1, x2_class1), hcat(x1_class2, x2_class2))'
y_class = vcat(ones(n_points÷2), zeros(n_points÷2))  # Labels: 1 for class 1, 0 for class 2

# Split into train/test
n_class = size(X_class, 2)
train_idx_class = 1:floor(Int, 0.8*n_class)
test_idx_class = (floor(Int, 0.8*n_class)+1):n_class

X_train_class = X_class[:, train_idx_class]
y_train_class = y_class[train_idx_class]
X_test_class = X_class[:, test_idx_class]
y_test_class = y_class[test_idx_class]

# Define classification model (sigmoid activation for binary output)
class_model = Chain(
    Dense(2, 8, relu),
    Dense(8, 1, sigmoid)
)

# Binary cross-entropy loss
class_loss(m, x, y) = Flux.mean(Flux.binarycrossentropy.(m(x), y))

# Optimizer
class_opt_state = Flux.setup(Adam(0.01), class_model)

# Training loop
println("Training classifier...")
class_epochs = 1000
class_loss_history = Float64[]

for epoch in 1:class_epochs
    gs = Flux.gradient(m -> class_loss(m, X_train_class, y_train_class), class_model)
    Flux.update!(class_opt_state, class_model, gs[1])
    
    if epoch % 100 == 0
        current_loss = class_loss(class_model, X_train_class, y_train_class)
        push!(class_loss_history, current_loss)
        println("Epoch $epoch: Loss = $current_loss")
    end
end

# Evaluate classifier
predictions = class_model(X_test_class) .> 0.5  # Apply threshold
accuracy = mean(predictions .== y_test_class)
println("Classification Accuracy: $(accuracy*100)%")

# 5. Visualization
println("\nGenerating visualizations...")

# Plot 1: Linear Regression
p1 = scatter(x_train', y_train', label="Training Data", title="Linear Regression", xlabel="x", ylabel="y")
plot!(x_train', model(x_train)', label="Flux Model", linewidth=2)
plot!(x_train', 2.0 .* x_train' .+ 3.0, label="True Function", linestyle=:dash)

# Plot 2: Non-linear Function Approximation
p2 = scatter(x_train_nonlin', y_train_nonlin', label="Training Data", title="Neural Network Approximation", xlabel="x", ylabel="y")
plot!(x_nonlin', nn_model(x_nonlin)', label="NN Prediction", linewidth=2)
plot!(x_nonlin', sin.(x_nonlin') .+ 0.1 .* x_nonlin'.^2, label="True Function", linestyle=:dash)

# Plot 3: Classification
p3 = scatter(X_train_class[1, y_train_class .== 1], X_train_class[2, y_train_class .== 1], 
             label="Class 1", title="Binary Classification")
scatter!(X_train_class[1, y_train_class .== 0], X_train_class[2, y_train_class .== 0], 
         label="Class 0")

# Create a grid to visualize decision boundary
x1_grid = range(-5, 5, length=100)
x2_grid = range(-5, 5, length=100)
grid_points = hcat([[x1, x2] for x1 in x1_grid, x2 in x2_grid]...)
grid_predictions = reshape(class_model(grid_points') .> 0.5, length(x1_grid), length(x2_grid))

contour!(x1_grid, x2_grid, grid_predictions, levels=[0.5], color=:black, linewidth=2, label="Decision Boundary")

# Plot 4: Training Loss Curves
p4 = plot(1:50:epochs, loss_history, label="Linear Regression", title="Training Loss", xlabel="Epoch", ylabel="Loss", legend=:topright)
plot!(1:100:nn_epochs, nn_loss_history, label="Neural Network")
plot!(1:100:class_epochs, class_loss_history, label="Classifier")

# Display all plots
plot(p1, p2, p3, p4, layout=(2,2), size=(1000, 800))
savefig("ml_examples.png")
println("Plots saved as 'ml_examples.png'")

# 6. Comparison with MLJ (Higher-level ML library)
println("\n=== Comparison with MLJ ===")

# Prepare data for MLJ
X_mlj = MLJ.table(x_train')
y_mlj = vec(y_train')

# Load and train a linear regression model from MLJ
LR = @load LinearRegressor pkg=MLJLinearModels
lr_model = LR()
lr_machine = machine(lr_model, X_mlj, y_mlj)
fit!(lr_machine)

# Predict and evaluate
y_pred_mlj = predict(lr_machine, MLJ.table(x_test'))
mlj_mse = mean((y_pred_mlj .- vec(y_test')).^2)
println("MLJ Linear Regression MSE: $mlj_mse")

# Compare with Flux model
flux_mse = mean((vec(model(x_test')) .- vec(y_test')).^2)
println("Flux Linear Regression MSE: $flux_mse")

println("\n=== Summary ===")
println("This program demonstrated:")
println("1. Linear regression with Flux")
println("2. Non-linear function approximation with neural networks")
println("3. Binary classification with sigmoid activation")
println("4. Visualization of results and decision boundaries")
println("5. Comparison with MLJ (high-level ML library)")

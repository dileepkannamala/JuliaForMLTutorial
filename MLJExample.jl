using Pkg
Pkg.add(["MLJ", "MLJDecisionTreeInterface", "DataFrames", "Statistics"])

using MLJ          # Main MLJ package
using MLJDecisionTreeInterface  # Provides DecisionTreeClassifier
using DataFrames   # For tabular data handling
using Statistics   # For mean()

# 1. Load the Iris dataset
iris = @load_iris
X, y = iris[:, 1:4], iris[:, :target]  # Features and target

# 2. Define the model
Tree = @load DecisionTreeClassifier pkg=DecisionTree
model = Tree(max_depth=3)  # Limit tree depth for simplicity

# 3. Wrap data in MLJ's machine
mach = machine(model, X, y)

# 4. Train the model
fit!(mach)

# 5. Make predictions
y_pred = predict(mach, X)

# 6. Evaluate accuracy
acc = mean(mode.(y_pred) .== y)
println("Accuracy: ", round(acc * 100, digits=2), "%")

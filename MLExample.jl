using MLJ
using DataFrames
using MLDatasets: Iris

# using FileIO, JLD2

# 1. Load the dataset
# The `load()` function from MLDatasets returns a DataFrame
# iris_data = Iris.load() |> DataFrame

dataset = Iris()
X = dataset.features         # This is a DataFrame by default in latest MLDatasets
y = dataset.targets.class    # Access targets directly

# Ensure X is a DataFrame (if not already)
iris_data = DataFrame(X)


println("Dataset loaded. Number of rows: ", nrow(iris_data))
println("Columns: ", names(iris_data))

# 2. Define the features (X) and target variable (y)
# Convert features to a matrix format suitable for many MLJ models
features = ["sepallength", "sepalwidth", "petallength", "petalwidth"]
X = select(iris_data, features)
y = iris_data[:,end]
y = coerce(y, Multiclass)

# Check the types of the target variable and coerce them to a standard MLJ format
# In this case, the `class` column should be a `Multiclass` type
#y = coerce(y, Multiclass)

# 3. Split the data into training and testing sets
# We use 70% for training and 30% for testing, with a fixed random seed for reproducibility
train, test = partition(eachindex(y), 0.7, shuffle=true, rng=123)

X_train, X_test = X[train, :], X[test, :]
y_train, y_test = y[train], y[test]

println("\nData split into training (70%) and testing (30%) sets.")

# 4. Define the model
# Load the model type for a Decision Tree Classifier
DecisionTreeClassifier = @load DecisionTreeClassifier pkg=DecisionTree

# Instantiate the model with default hyperparameters
model = DecisionTreeClassifier()

# 5. Train the model
# Machine learning in MLJ uses a "machine" object to connect data and the model
mach = machine(model, X_train, y_train)
fit!(mach)

println("Model training complete.")

# 6. Make predictions on the test set
y_pred = predict_mode(mach, X_test)

# 7. Evaluate the model performance
# We use the accuracy metric
accuracy_score = accuracy(y_pred, y_test)

println("\nModel Accuracy on test set: ", round(accuracy_score, digits=4))

# Example of a single prediction
# Let's create a new "flower" (as a DataFrame row)
new_flower = DataFrame(sepal_length = 5.1, sepal_width = 3.5, petal_length = 1.4, petal_width = 0.2)
prediction = predict_mode(mach, new_flower)

println("\nPrediction for a new flower (sepal_length=5.1, ...): ", prediction)

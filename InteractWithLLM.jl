using HTTP
using JSON

url = "http://localhost:11434/api/generate"

function generate_response(question, model_name="Jayasimma/healthsoft:latest")
    data = Dict(
        "model" => model_name,
        "prompt" => question,
        "stream" => false # Set to true for streaming responses
    )

    # Send a POST request to the Ollama API
    response = HTTP.post(url, 
                         ["Content-Type" => "application/json"], 
                         body=JSON.json(data))

    # Parse and return the response
    if response.status == 200
        json_response = JSON.parse(String(response.body))
        return json_response["response"]
    else
        return "Error: " * String(response.body)
    end
end

# Example usage
question = "Severe cough x 4 days, sneezing, iritation in eyes"
answer = generate_response(question)
println(answer)

#=
# Another way to do this
using PromptingTools

# Use a specific model you have pulled, e.g., "mistral"
# The package handles the API calls in the background.
response = aigenerate("Explain Newton's second law in Julia.", model="mistral")

# Print the response content
println(response.content)
=#


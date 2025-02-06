# Ollama & DeepSeek R1 in local

## Installing Ollama

https://ollama.com/download

```
# Run ollama
ollama run llama3.2
```

```
# List models
ollama list
```

## Running DeepSeek R1 on Ollama

`deepseek-r1:1.5b`

```sh
# Pull the DeepSeek R1 Model
ollama pull deepseek-r1:1.5b


# Running DeepSeek R1
ollama run deepseek-r1:1.5b
```

```sh
# 1.5B version (smallest):
ollama run deepseek-r1:1.5b

# 8B version:
ollama run deepseek-r1:8b

# 14B version:
ollama run deepseek-r1:14b

# 32B version:
ollama run deepseek-r1:32b

# 70B version (biggest/smartest):
ollama run deepseek-r1:70b
```

```sh
# Current model in my local
# Pull the DeepSeek R1 Model
ollama pull deepseek-r1:8b

# Running DeepSeek R1
ollama run deepseek-r1:8b
```

```
http://localhost:11434/

# Ollama is running
```

## Kill ollama

On MAC: Top app icons -> Find ollama -> Quit ollama

```
ps aux | grep ollama

killall ollama
```

## Sending Requests to locally downloaded DeepSeek-R1 via Ollama:

Ollama API: https://github.com/ollama/ollama/blob/main/docs/api.md

```
ollama serve
```

```
curl -X POST http://localhost:11434/api/generate -d '{
"model": "deepseek-r1:8b",
"prompt": "How do I change ollama service port in my local",
"stream": false
}'
```

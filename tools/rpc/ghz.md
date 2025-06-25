https://ghz.sh/docs/install

## Installation

Homebrew: `brew install ghz`

## Usage

### Basic Usage

```bash
# Basic load test with 1000 requests using 50 concurrent workers
ghz --insecure --proto ./greeter.proto --call helloworld.Greeter.SayHello -d '{"name":"World"}' -n 1000 -c 50 localhost:50051

# Test with custom RPS (requests per second)
ghz --insecure --proto ./greeter.proto --call helloworld.Greeter.SayHello -d '{"name":"World"}' -r 100 -z 30s localhost:50051
```

### Common Scenarios

#### 1. Testing with Proto File

```bash
# Test a gRPC service with proto file
ghz --insecure \
  --proto ./api/user.proto \
  --call user.UserService.GetUser \
  -d '{"id": 123}' \
  -n 500 \
  -c 20 \
  localhost:8080
```

#### 2. Testing with JSON Data File

```bash
# Use external JSON file for request data
ghz --insecure \
  --proto ./api/order.proto \
  --call order.OrderService.CreateOrder \
  -D ./test-data/order.json \
  -n 200 \
  -c 10 \
  localhost:9090
```

#### 3. Duration-based Testing

```bash
# Run test for specific duration (5 minutes)
ghz --insecure \
  --proto ./api/product.proto \
  --call product.ProductService.SearchProducts \
  -d '{"query": "test"}' \
  -z 5m \
  -c 30 \
  localhost:8080
```

#### 4. Load Testing with Different Patterns

```bash
# Constant load
ghz --insecure --proto ./api.proto --call service.Method -d '{}' --load-schedule const -r 50 -z 60s localhost:8080

# Step load (start at 10 RPS, step to 100 RPS over 5 minutes)
ghz --insecure --proto ./api.proto --call service.Method -d '{}' --load-schedule step --load-start 10 --load-end 100 --load-step 10 --load-step-duration 30s localhost:8080

# Linear load increase
ghz --insecure --proto ./api.proto --call service.Method -d '{}' --load-schedule line --load-start 10 --load-end 100 --load-max-duration 300s localhost:8080
```

#### 5. Authentication & Headers

```bash
# With metadata/headers (authentication)
ghz --insecure \
  --proto ./api/auth.proto \
  --call auth.AuthService.ValidateToken \
  -d '{"token": "jwt-token-here"}' \
  -m '{"authorization": "Bearer jwt-token"}' \
  -n 100 \
  localhost:8080

# Using metadata file
ghz --insecure \
  --proto ./api.proto \
  --call service.Method \
  -d '{}' \
  -M ./metadata.json \
  -n 100 \
  localhost:8080
```

#### 6. TLS/SSL Testing

```bash
# With TLS certificate
ghz --proto ./api.proto \
  --call service.Method \
  -d '{}' \
  --cert ./client.crt \
  --key ./client.key \
  --cacert ./ca.crt \
  -n 100 \
  your-service.com:443

# Skip TLS verification (for testing)
ghz --proto ./api.proto \
  --call service.Method \
  -d '{}' \
  --skipTLS \
  -n 100 \
  your-service.com:443
```

#### 7. Output Formats

```bash
# JSON output for further processing
ghz --insecure --proto ./api.proto --call service.Method -d '{}' -n 100 -O json localhost:8080 > results.json

# HTML report
ghz --insecure --proto ./api.proto --call service.Method -d '{}' -n 100 -O html -o report.html localhost:8080

# CSV format
ghz --insecure --proto ./api.proto --call service.Method -d '{}' -n 100 -O csv -o results.csv localhost:8080
```

#### 8. Streaming Tests

```bash
# Server streaming test
ghz --insecure \
  --proto ./stream.proto \
  --call stream.StreamService.ServerStream \
  -d '{"count": 10}' \
  --stream-call-duration 30s \
  -n 50 \
  localhost:8080

# Client streaming with interval
ghz --insecure \
  --proto ./stream.proto \
  --call stream.StreamService.ClientStream \
  -d '{"message": "test"}' \
  --stream-interval 1s \
  --stream-call-count 5 \
  -n 10 \
  localhost:8080
```

#### 9. Using Protoset (Compiled Proto)

```bash
# Using compiled protoset instead of proto file
ghz --insecure \
  --protoset ./compiled.protoset \
  --call package.Service.Method \
  -d '{"field": "value"}' \
  -n 200 \
  localhost:8080
```

#### 10. Configuration File

```bash
# Using config file (JSON or TOML)
ghz --config ./load-test-config.json

# Example config.json:
# {
#   "proto": "./api.proto",
#   "call": "service.Method",
#   "host": "localhost:8080",
#   "insecure": true,
#   "data": {"field": "value"},
#   "total": 1000,
#   "concurrency": 50,
#   "rps": 100,
#   "duration": "2m"
# }
```

### Key Parameters

- `-n, --total`: Number of requests (default: 200)
- `-c, --concurrency`: Concurrent workers (default: 50)
- `-r, --rps`: Requests per second rate limit
- `-z, --duration`: Test duration (e.g., 30s, 5m)
- `-t, --timeout`: Request timeout (default: 20s)
- `-d, --data`: Request data as JSON string
- `-D, --data-file`: Request data from file
- `-m, --metadata`: Request metadata as JSON
- `-O, --format`: Output format (summary, json, csv, html)
- `--insecure`: Use plaintext connection
- `--skipTLS`: Skip TLS verification

### Tips

1. **Start Small**: Begin with low concurrency and request counts
2. **Monitor Resources**: Watch CPU/memory usage on both client and server
3. **Use Realistic Data**: Test with production-like request payloads
4. **Warm Up**: Run a small test first to warm up connections
5. **Results Analysis**: Use different output formats for detailed analysis

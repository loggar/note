# k8s

```
# List context
kubectl config get-contexts

# List namespaces
kubectl get namespaces
kubectl get ns

# Remove namespaces
kubectl --context <context> delete ns <ns1> <ns2> ...

# List pods
kubectl --context <context> --namespace=<ns> get pods
```

## Permissions

```
kubectl auth can-i --list
```

## Access a shell inside Kubernetes

```
# Connect a pod
kubectl --context <context> --namespace=<ns> exec -it <pod-name> --as <role> -- sh
kubectl attach <pod-name> -c <pod-name> -i -t

# Destroy a pod
kubectl --context <context> --namespace=<ns> delete pod <pod-name> --as <role>
```

```
# Pod info
kubectl --context <context> --namespace=<ns> get pod -o wide
```

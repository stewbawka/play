# Istio stuff

## Install

* `istioctl install --set profile=demo -y`
* `kubectl label namespace default istio-injection=enabled`

## Troubleshooting

"Jwks doesn't have key to match kid or alg from Jwt"
Try restarting istiod so it refreshes jwks `kubectl rollout restart deployment istiod -n istio-system`
Verify restart : `kubectl get pods -n istio-system`
Log istiod events : `kubectl logs -n istio-system -l app=istiod`


# Kafka setup stuff

https://blog.datumo.io/setting-up-kafka-on-kubernetes-an-easy-way-26ae150b9ca8

viewer

`brew install kafkacat`
`kcat -b localhost:9092 -L`

# Tilt setup

## Install
`curl -fsSL https://raw.githubusercontent.com/tilt-dev/tilt/master/scripts/install.sh | bash`

## Run project
`tilt up`

# Skaffold setup

## Install
`brew install skaffold`

## Run project
`skaffold dev`

## Troubleshooting port-forwards
`ps -f | grep 'kubectl' | grep 'port-forward' | awk '{print $10 " " $11}'`

# k9s setup
Used for inspecting running k8s workloads

## Install
`brew install k9s`

## Protobufs

Protobufs found in /protobufs directory

# troubleshooting cmd
* make sure deps are installed 
* make sure PATH and GOPATH env variables set properly

```
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
```

# example cmds to generate client code 
* go-auth (golang) : `protoc --go_out=go-auth protobufs/user.proto`
* rekkids (elixir) : `protoc --elixir_out=rekkids/lib protobufs/user.proto`

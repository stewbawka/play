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

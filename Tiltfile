# -*- mode: Python -*-

k8s_yaml([
    'manifests/mysql.yaml', 
    'manifests/go-auth.yaml', 
    'manifests/rekkids.yaml', 
    'manifests/rekkids-jobs.yaml', 
    'manifests/istio.yaml',
])
k8s_resource('go-auth', port_forwards='8080:80')
k8s_resource('rekkids', port_forwards='4000:4000')
k8s_resource('mysql', port_forwards='3306:3306')

local_resource(
    'generate-jwt-keypairs', 
    cmd='cd jwt-keypairs; openssl genrsa -out private-key.pem 2048; openssl rsa -in private-key.pem -pubout -out public-key.pem',
)

docker_build('go-auth-image', 'go-auth/.')
docker_build('rekkids-image', 'rekkids/.')

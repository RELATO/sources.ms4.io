# Istio (recommended for kubernetes clusters)

## Recent videos
https://www.youtube.com/watch?v=KLBFR_rUreE

## Some references:
https://istio.io/docs/setup/kubernetes/download/

https://istio.io/docs/setup/kubernetes/install/kubernetes/

https://istio.io/docs/tasks/traffic-management/ingress/#determining-the-ingress-ip-and-ports
https://istio.io/docs/examples/bookinfo/

## commands to run to install and verify 
```
for i in install/kubernetes/helm/istio-init/files/crd*yaml; do kubectl apply -f $i; done
kubectl apply -f install/kubernetes/istio-demo.yaml
kubectl get svc -n istio-system
kubectl get pods -n istio-system
```

> commands to run for enabling injection of side-cars
```
kubectl create namespace istiodemo
kubectl label namespace istiodemo istio-injection=enabled
```

## Demo app installation

### commands to run - for booking app installation ( demo app )
``` 
kubectl apply -n istiodemo -f samples/bookinfo/platform/kube/bookinfo.yaml
kubectl get services -n istiodemo
kubectl get pods -n istiodemo
```

> command to run to verify if services are OK
``` 
kubectl exec -it $(kubectl get pod -n istiodemo -l app=ratings -o jsonpath='{.items[0].metadata.name}') -n istiodemo -c ratings -- curl productpage:9080/productpage | grep -o "<title>.*</title>"
``` 

> Enabling the gateway if everything went OK
``` 
kubectl apply -n istiodemo -f samples/bookinfo/networking/bookinfo-gateway.yaml
``` 

## commands to inspect host and ports config 
>  if LOADBALANCED is present
``` 
export INGRESS_HOST=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].port}')
export SECURE_INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="https")].port}')
```  
or

>  if LOADBALANCED is NOT present
``` 
export INGRESS_HOST=$(kubectl get po -l istio=ingressgateway -n istio-system -o jsonpath='{.items[0].status.hostIP}')
``` 

# commands to test external access ( final test )
``` 
export GATEWAY_URL=$INGRESS_HOST:$INGRESS_PORT
curl -s http://${GATEWAY_URL}/productpage | grep -o "<title>.*</title>"
``` 

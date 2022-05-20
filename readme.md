

Infraestructura con kubernetes

 -00-provider.tf
  Provedor de infraestructura
 -01-vcp.tf
  CDIRS block a usar
 -02-internet_gateway.tf
  Creacion de gateway para salida a internet
 -03-subnets.tf
  Redes necesarias para el cluster en dos sitios
 -04-nat.tf
  Configuracin de interfaz donde se usara el nateo
 -05-route.tf
  Rutas hacia cada red
 -06-eks.tf
  Declaracion de cluster
 -07-nodes.tf
  Declaracion de los nodos, y crea el grupo de configuracion de escalado, el cual tiene que agregarce unas configuraciones manuales
 -08-iamoidc.tf
  Rol iam para cluster
 -09-iam-autoscaler.tf
  Rol necesario para el autoscalamiento de nodos


terraforn init
terraform apply

Actualizar el kubeconfig
aws eks --region us-west-1 update-kubeconfig --name boletia 


Implementar servicio necesario autodiscovery de cluster autoscaler kubernetes

kubectl apply -f ./addons/cluster-autoscaler.yaml


Implementar el servidor de métricas
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
kubectl get deployment metrics-server -n kube-system

Deploy secret ECR 


kubectl create secret docker-registry regcred-ecr-aws \
  --docker-server=644864138934.dkr.ecr.us-east-1.amazonaws.com \
  --docker-username=AWS \
  --docker-password=$(aws ecr get-login-password)
# terraform-minikube

## 1. Prerequired
* minikube
* kubectl
* terraform
* helm

### 1.1. Install prerequired
* ```bash
  git clone https://github.com/eresseel/minikube-playbook.git
  ```
* ```bash
  cd minikube-playbook
  ```
* Open README.md for instructions

## 2. Deploy in minikube
```bash
cd /env/minikube/live
terraform init
terraform plan
terraform apply -var password=<password>
```

## 3. Redis information
```bash
helm -n kube-application get all redis
```

## 4. The URL of Prometheus
```bash
http://prometheus.example.live
```

## 5. Grafana information
### 5.1. The URL of Grafana
```bash
http://grafana.example.live
```
### 5.2. Get Grafana password
```bash
kubectl get secret -n kube-monitoring grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo
```

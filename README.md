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

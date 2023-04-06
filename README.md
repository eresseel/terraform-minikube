# terraform-minikube

## 1. Prerequired
* virtualbox
* minikube
* kubectl
* terraform
* helm

### 1.1. Install prerequired
### 1.1.1 Install Virtualbox
```bash
sudo apt-get install -y ca-certificates curl apt-transport-https
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/oracle-virtualbox-2016.gpg] https://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
wget -O- https://www.virtualbox.org/download/oracle_vbox_2016.asc | sudo gpg --dearmor --yes --output /usr/share/keyrings/oracle-virtualbox-2016.gpg
sudo apt-get update
sudo apt-get install virtualbox-7.0
sudo apt-get install virtualbox-ext-pack
```

### 1.1.2 Install minikube and start
```bash
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
sudo dpkg -i minikube_latest_amd64.deb
minikube start --driver=virtualbox
minikube addons enable ingress
```

### 1.1.3 Install kubectl
```bash
sudo apt-get install -y ca-certificates curl apt-transport-https
sudo curl -fsSLo /etc/apt/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl
```

### 1.1.4 Install terraform
```bash
sudo apt update && sudo apt install gpg
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update
sudo apt install terraform
```

### 1.1.5 Install helm
```bash
curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
sudo apt-get install apt-transport-https --yes
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install helm
```

## 2. Add ip and domain in /etc/hosts
### 2.1. Get minikube ip for non-root user
```bash
minikube ip
```

### 2.2. Update root user's /etc/hosts file
```bash
echo "<minikube ip address>   flask.example.live" >> /etc/hosts
echo "<minikube ip address>   prometheus.example.live" >> /etc/hosts
echo "<minikube ip address>   alertmanager.example.live" >> /etc/hosts
echo "<minikube ip address>   grafana.example.live" >> /etc/hosts
```

## 3. Deploy in minikube
```bash
cd env/minikube/live
terraform init
terraform plan
terraform apply -var password=password
```

## 4. The URL of services
* http://flask.example.live
* http://prometheus.example.live
* http://alertmanager.example.live
* http://grafana.example.live

### 5. Get Grafana password
```bash
kubectl get secret -n kube-monitoring grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo
```

### 6. Run alert test
```bash
kubectl apply -f alerting/test-nginx.yml
```

### 7. Screenshots path
`./alerting/screenshot`

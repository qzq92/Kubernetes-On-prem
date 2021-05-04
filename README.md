# Local Kubernetes(K8s) cluster setup 
- The configuration and setup files here are created, edited and modified by referencing from various online sources which assisted in the setup of on-premise Kubernetes cluster. The configuration files also include other tools such as MetalLB, Goldpinger,K8dash, Nvidia-dcgm, Prometheus and Grafana. Please note that yaml files dictates Kubernetes configuration and can either end with a .yaml or .yml extension in filenames.

## Kubernetes version
- 1.15.3

## Docker images 
- This repository does not provide the docker images required for all deployed tools as stated as docker images can be large in nature which Github by default does not store large files. As such, the docker images would need to be pulled using an internet facing computer (not much of an issue if your intended cluster is internet facing). Otherwise, you would need to refer to all yaml files used to dictate the deployment of containers as your reference in identifying what docker images are required (identified by image: xxx). 
- For convenience, I have placed a text file named image.list in each sub folder and main folder representing the tools which indicates the necessary docker images required.

**Please be informed that nvidia-dcgm-exporter-prom-grafana folder contains the configuration scripts that are used for deploying Nvidia-DCGM, Prometheus and Grafana.**

## Pre-requisites
- Ubuntu 18.04
- At least 2 connected machines via network cable, using static IP
- Internet connection (To download required docker images)
- Kubernetes binaries (kubeadm, kubectl and kubelet v1.15.3)
- Docker v19.03.X
- Helm binary v3.1.2
- Etcd v3.3.18
- Keepalived v1.3.9 or v2.0.20
- Cfssl v1.2 binaries (HTTP API server for signing, verifying, and bundling TLS certificates used for K8s)
 - https://pkg.cfssl.org/R1.2/cfssl_linux-amd64
 - https://pkg.cfssl.org/R1.2/cfssljson_linux-amd64

## Documentations
- Refer to Kubernetes_Deployment_edit.odt for more details on the cluster configurations. This documentation only covers content related to Kubernetes setup and configuration.
- Refer to Nvidia-DCGM-Prometheus-Grafanav1.odt for more details on setting up, configuring using Prometheus and Grafana to have an overview on existing Kubernetes resources such as pods, persistent volumes, etc, gpu utilisation. For grafana dashboards, most of them are adapted from the following link: [Grafana dashboards](https://grafana.com/grafana/dashboards)

## Acknowledgement
- Kubernetes v1.15 guide (Not available as it has been deprecated). Official Kubernetes webpage [Kubernetes](https://kubernetes.io/)
- External storage for Kubernetes to be cloned: [External-storage](https://github.com/kubernetes-incubator/external-storage.git)

## Notes on using other versions
- Please note that the setup may not work with latest versions of kubectl, kubeadm and kubelet as Kubernetes had made functionality changes in later versions


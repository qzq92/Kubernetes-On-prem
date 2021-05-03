# Local Kubernetes(K8s) cluster setup 
- The configuration and setup files here are created, edited and modified by referencing from various online sources which assisted in the setup of on-premise Kubernetes cluster. The configuration files also include other tools such as MetalLB, Nvidia-dcgm, Prometheus and Grafana

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

## Kubernetes version
- 1.15.3

## Acknowledgement
- Kubernetes v1.15 guide (Not available as it has been deprecated). Official Kubernetes webpage [Kubernetes](https://kubernetes.io/)
- External storage for Kubernetes to be cloned: [External-storage](https://github.com/kubernetes-incubator/external-storage.git)

## Notes on using other versions
- Please note that the setup may not work with latest versions of kubectl, kubeadm and kubelet as Kubernetes had made functionality changes in later versions


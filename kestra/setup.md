## 1. SSH Config file to connect to GCP VM using Visual Studio Code
```bash
Host gcp-kestra-vm
    HostName 34.105.244.38 # External IP of GCP VM
    User kestra_user
    IdentityFile C:\Users\YourUserName\.ssh\gcp-kestra-vm
    # gcp-kestra-vm hosts your private key while public key is configured into GCP VM
```

## 2. Install Docker on VM
### Follow https://docs.docker.com/engine/install/ubuntu/#install-using-the-convenience-script for more details
```bash
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
```
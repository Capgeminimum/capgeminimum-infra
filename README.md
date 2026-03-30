# Capgeminimum Infrastructure

Infrastructure Kubernetes for Raspberry Pi 5 using k3s and Ansible.

## Directory Structure

```bash
k3s/               - k3s installation script
ansible/           - Provisioning automation
  inventories/     - Inventory configuration
    hosts.ini      - (CONFIDENTIAL - not committed)
    hosts.ini.example - Template for team members
  playbooks/       - Ansible playbooks
    setup-k3s.yml  - Full k3s + system setup
README.md          - This file
.gitignore         - Security rules
```

## Quick Start

### Setup Ansible Inventory

#### 1. Copy the template

```bash
cp ansible/inventories/hosts.ini.example ansible/inventories/hosts.ini
```

#### 2. Edit `hosts.ini` with your Raspberry Pi details

```ini
[raspberry_pi]
rpi-master ansible_host=<YOUR_RPI_IP> ansible_user=<SSH_USER> ansible_ssh_private_key_file=~/.ssh/id_rsa
```

### Install k3s

#### Option A: Manual

```bash
ssh <SSH_USER>@<RPI_IP>
sudo bash k3s/install-k3s.sh
```

#### Option B: Automated (Ansible)

```bash
ansible-playbook -i ansible/inventories/hosts.ini ansible/playbooks/setup-k3s.yml
```

### Verify Installation

```bash
kubectl get nodes
kubectl get pods --all-namespaces
```

## What's Included

- ✅ **k3s** - Lightweight Kubernetes
- ✅ **Ansible** - Infrastructure automation
- ✅ **Security** - SSH keys + sensitive data protection

## TODO - INFRA Team

- [ ] Create Helm charts for frontend (Angular)
- [ ] Create Helm chart for backend (Node.js)
- [ ] Create Helm chart for PostgreSQL database
- [ ] Create Helm chart for Redis cache
- [ ] Test deployment on Raspberry Pi
- [ ] Document Kubernetes deployment process
- [ ] Setup monitoring and logging (optional)

## Notes

- `hosts.ini` is in `.gitignore` - Never commit credentials
- Always use SSH key authentication
- Use `hosts.ini.example` as reference for team members

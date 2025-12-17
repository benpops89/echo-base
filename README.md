# 🚀 Echo Base

**Echo Base** is my Star Wars–themed infrastructure repo, inspired by the Rebel Alliance's hidden base on Hoth. It uses Ansible for configuration management and Terraform/OpenTofu for provisioning infrastructure in my homelab.

## 🏗️ Infrastructure

- **Coruscant** 🖥️ – Storage and AI server (playbook: `coruscant.yml`)
- **Tungol** 🌐 – VPS for additional services (playbook: `tungol.yml`)

## 📁 Structure

- Root-level playbooks – Entry point playbooks for each machine:
  - `coruscant.yml` – Configures Coruscant (storage/AI server)
  - `tungol.yml` – Configures Tungol (VPS for services)
- `roles/` – Reusable Ansible components:
  - `ai/` 🤖 – AI/ML tools (ComfyUI, Ollama, OpenWebUI)
  - `automation/` ⚙️ – Workflow automation (Kestra, n8n)
  - `database/` 🗄️ – Database services (PostgreSQL)
  - `media/` 🎥 – Media processing (HandBrake, MKV)
  - `nvidia/` 🎮 – NVIDIA GPU drivers and toolkit
  - `pkm/` 📚 – Personal knowledge management (Readeck)
- `inventories/` – Inventory definitions for different environments (home, cloud, etc.)
- `group_vars/` – Shared configuration across hosts
- `terraform/` – OpenTofu configurations for provisioning resources:
  - `modules/ses/` 📧 – SMTP email configuration using AWS SES, integrated with Cloudflare

## ⚙️ Setup

### Prerequisites

- [mise](https://mise.jdx.dev/) 🔧 for tool management
- AWS CLI configured with SSO profile "terraform" ☁️
- [fnox](https://fnox.dev/) 🔐 for secret management (configured via `fnox.toml`)

### Ansible

Install dependencies:

```bash
ansible-galaxy install -r requirements.yml
```

Run playbooks:

```bash
# For Coruscant (storage/AI server)
mise run coruscant

# For Tungol (VPS)
mise run tungol
```

### Terraform/OpenTofu

Use mise to install and manage OpenTofu:

```bash
mise install
```

Authenticate with AWS:

```bash
mise run login
```

Initialize Terraform:

```bash
mise run init
```

Plan changes:

```bash
mise run plan
```

Apply changes:

```bash
mise run apply
```

Run playbooks:

```bash
# For Coruscant (storage/AI server)
mise run coruscant

# For Tungol (VPS)
mise run tungol
```

### Terraform/OpenTofu

Use mise to install and manage OpenTofu:

```bash
mise install
```

Authenticate with AWS:

```bash
mise run login
```

Initialize Terraform:

```bash
mise run init
```

Plan changes:

```bash
mise run plan
```

Apply changes:

```bash
mise run apply
```

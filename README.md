# Echo Base

**Echo Base** is my Star Wars–themed Ansible infrastructure repo, inspired by the Rebel Alliance's hidden base on Hoth. It manages the configuration of machines in my fleet with reusable roles and per-host playbooks.

## Structure

- `playbooks/` – Entry point playbooks for each machine
- `roles/` – Reusable components (e.g. NVIDIA driver, ZFS, Docker)
- `inventories/` – Inventory definitions for different environments (home, cloud, etc.)
- `group_vars/` – Shared configuration across hosts

## Setup

Install dependencies:

```bash
ansible-galaxy install -r requirements.yml

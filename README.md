# workstation

## Init

First you need this repo, and Ansible. So lets start with that:
```bash
sudo apt update
sudo apt install -y git ansible
```

To start with the setup via Ansible, copy [variables.example.yml](variables.example.yml) into `variables.yml` and insert your values.
```bash
cp variables.example.yml variables.yml
```

Then, run the init playbook:
- This will install the zsh shell
- Restart / Relog your workstation afterwards, since the changes need to take effect before continuing
```bash
ansible-playbook --ask-become-pass --skip-tags "only-company" --diff playbooks/init.yml # For private notebook
ansible-playbook --ask-become-pass --skip-tags "only-private" --diff playbooks/init.yml # For company notebook
```

**The best is now to restart the system. A logout/login might be enough, but a reboot is safer to update the changes made on the default shell.**

After that, follow the instructions for a regular [Run](#Run).

## Run

Use on of these commands to run the main Ansible playbook:
```bash
ansible-playbook --ask-become-pass --diff playbooks/main.yml
```

## Add a new role

```bash
ansible-galaxy init test-role-1
rm test-role-1/.travis.yml
```

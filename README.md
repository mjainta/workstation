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

Then, init the zsh shell:
```bash
ansible-playbook --ask-become-pass --tags "init" --skip-tags "only-company" --diff setup.yml # For private notebook
ansible-playbook --ask-become-pass --tags "init" --skip-tags "only-private" --diff setup.yml # For company notebook
```

**The best is now to restart the system. A logout/login might be enough, but a reboot is safer to update the changes made on the default shell.**

After that, follow the instructions for a regular [Run](#Run).

## Run

Use on of these commands to run Ansible:
```bash
ansible-playbook --ask-become-pass --skip-tags "init,only-company" --diff setup.yml # For private notebook
ansible-playbook --ask-become-pass --skip-tags "init,only-private" --diff setup.yml # For company notebook
```

## Add a new role

```bash
ansible-galaxy init test-role-1
rm test-role-1/.travis.yml
```

# workstation

## Commands

First, init the zsh shell:
```bash
ansible-playbook --ask-become-pass --tags "init" --skip-tags "only-company" --diff setup.yml # For private notebook
ansible-playbook --ask-become-pass --tags "init" --skip-tags "only-private" --diff setup.yml # For company notebook
```

After that, *reboot* to update the changes made on the default shell.

Now, run the following:
```bash
ansible-playbook --ask-become-pass --skip-tags "init,only-company" --diff setup.yml # For private notebook
ansible-playbook --ask-become-pass --skip-tags "init,only-private" --diff setup.yml # For company notebook
```

## Add a new role

```bash
ansible-galaxy init test-role-1
rm test-role-1/.travis.yml
```

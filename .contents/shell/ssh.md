# ssh

## init setup of id_rsa
```
remote=""
id_rsa_name="xxx_id_rsa"

ssh-keygen -t rsa -f ~/.ssh/$id_rsa_name
# chmod 600 ~/.ssh/$id_rsa_name
ssh $remote "mkdir -p ~/.ssh && chmod 700 ~/.ssh"
scp ~/.ssh/$id_rsa_name.pub $remote:~/.ssh/
ssh $remote "cat ~/.ssh/$id_rsa_name.pub >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys"
```

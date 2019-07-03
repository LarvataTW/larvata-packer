# Packer

1. make init
2. vim .env
3. source .env
4. cd vmware/ubuntu
5. packer build -debug -var 'vsphere_vm_new_password=高複雜度的新密碼' main.json

## Plugins

https://github.com/jetbrains-infra/packer-builder-vsphere

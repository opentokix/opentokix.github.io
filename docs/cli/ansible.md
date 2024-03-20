# Ansible

## Netbox Inventory

```yaml title="inventory.yml"
plugin: netbox.netbox.nb_inventory
api_endpoint: https://netbox.domain.tld
validate_certs: True
config_context: False
# Get token from environment variable
token: "{{ lookup('ansible.builtin.env', 'NETBOX_TOKEN') }}"
dns_name: True
# This will create automatic groups based on the tags, cluster etc from netbox. These groups can then be used in playbooks..
group_by:
  - cluster
  - tags
device_query_filters:
  - has_primary_ip: True
compose:
  #ansible_network_os: platform.slug
  ansible_host: name
  # Add a custom field in netbox under Other/Custom fields/SSH Username
  ansible_user: custom_fields.ssh_username
  ansible_ssh_common_args: '-o StrictHostKeyChecking=no'
```

## Test inventory

Here is an example of how to test the inventory files, this will ping all host that have the tag `ssh` in netbox. And will also login with the username defined in the custom field `ssh_username`.

```
ansible -i inventory.yml tags_ssh -m ping
```



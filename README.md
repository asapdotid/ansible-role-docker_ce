<p align="center"> <img src="https://user-images.githubusercontent.com/34257858/129839002-15e3f2c7-3f75-46d4-afae-0fd207d7fdde.png" width="100" height="100"></p>

<h1 align="center">
    Ansible Role Docker CE
</h1>

<p align="center" style="font-size: 1.2rem;">
    This ansible role setup install and configure Docker CE on your system.
</p>

<p align="center">
  <a href="https://www.ansible.com">
    <img src="https://img.shields.io/badge/Ansible-2.10-green?style=flat&logo=ansible" alt="Ansible">
  </a>
  <a href="LICENSE.md">
    <img src="https://img.shields.io/badge/License-MIT-blue.svg" alt="Licence">
  </a>
  <a href="https://ubuntu.com/">
    <img src="https://img.shields.io/badge/ubuntu-20.x-orange?style=flat&logo=ubuntu" alt="Distribution">
  </a>
  <a href="https://www.centos.org/">
    <img src="https://img.shields.io/badge/CentOS-8-green?style=flat&logo=centos" alt="Distribution">
  </a>
</p>

## Requirements (`requrements.yml`)

```yaml
roles:
  - name: asapdotid.docker_compose
    src: git+https://github.com/asapdotid/ansible-role-docker_ce.git
    scm: git
    version: << change with latest tag >> #sample 1.0.0
```

## Role Variables

| Name                         | Default Value | Description                  |
| ---------------------------- | ------------- | ---------------------------- |
| `docker_ce_privileged_users` | `"[]"`        | Package application install. |

## Dependencies

None.

## Example Playbook

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

```yaml
---
- hosts: all
  gather_facts: no
  become: yes
  vars:
    docker_ce_privileged_users:
      - vagrant

  roles:
    - role: asapdotid.docker_ce
```

## [License](#license)

Apache-2.0

## [Author Information](#author-information)

[JogjaScript](https://jogjascript.com)

This role was created in 2022 by [Asapdotid](https://github.com/asapdotid).

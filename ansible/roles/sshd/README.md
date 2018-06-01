Role Name
=========

Very basic load of an ssh file, 2 iteration will load the template with variables
=======

Requirements
------------

none
=======

Role Variables
--------------

none
=======


Dependencies
------------


none
=======


Example Playbook
----------------

---
- name: ssh config
  hosts: tag_Name_server_1_henry_com

  user: hgallo
  become: yes

  roles:
  - sshd


License
-------

BSD


Author Information
------------------
henry gallo

How to run
-----------------
ansible-playbook sshd.yml -i hosts --private-key=~/.ssh/id_rsa_vagrant -e ansible_ssh_port=2222

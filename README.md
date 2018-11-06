Role Name
=========

Web benchmark

Requirements
------------

Any pre-requisites that may not be covered by Ansible itself or the role should be mentioned here. For instance, if the role uses the EC2 module, it may be a good idea to mention in this section that the boto package is required.

Role Variables
--------------

A description of the settable variables for this role should go here, including any variables that are in defaults/main.yml, vars/main.yml, and any variables that can/should be set via parameters to the role. Any variables that are read from other roles and/or the global scope (ie. hostvars, group vars, etc.) should be mentioned here as well.

Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    Preparation:
      Update hosts information in inventory

    1. Webserver nginx+httpress:
      build server and client:
        ansible-playbook -i web-caliper/tests/inventory web-caliper/tests/site.yml -e "test_case=webserver server_app=nginx client_app=httpress"
      benchmark:
        ansible-playbook -i web-caliper/tests/inventory web-caliper/tests/test.yml -e "test_case=webserver server_app=nginx client_app=httpress"

    2. proxy nginx+nginx+httpress:
      build proxy, server and client:
        ansible-playbook -i web-caliper/tests/inventory web-caliper/tests/site.yml -e "test_case=proxy proxy_app=nginx server_app=nginx client_app=httpress"
      benchmark:
        ansible-playbook -i web-caliper/tests/inventory web-caliper/tests/test.yml -e "test_case=proxy server_app=nginx client_app=httpress"

    3. Https webserver nginx+httpress:
      build server and client:
        ansible-playbook -i web-caliper/tests/inventory web-caliper/tests/site.yml -e "test_case=https-webserver server_app=nginx client_app=httpress"
      benchmark:
        ansible-playbook -i web-caliper/tests/inventory web-caliper/tests/test.yml -e "test_case=https-webserver server_app=nginx client_app=httpress"

    4. Dynamic webserver: nginx+php+httpress:
      build nginx php httpress:
        ansible-playbook -i web-caliper/tests/inventory web-caliper/tests/site.yml -e "test_case=webserver-dynamic server_app=nginx client_app=httpress"
      benchmark:
        ansible-playbook -i web-caliper/tests/inventory web-caliper/tests/test.yml -e "test_case=webserver-dynamic server_app=nginx client_app=httpress"

    5. Webserver wrk+httpress:
      build server and client:
        ansible-playbook -i web-caliper/tests/inventory web-caliper/tests/site.yml -e "test_case=webserver server_app=nginx client_app=wrk"
      benchmark:
        ansible-playbook -i web-caliper/tests/inventory web-caliper/tests/test.yml -e "test_case=webserver server_app=nginx client_app=wrk"

License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).

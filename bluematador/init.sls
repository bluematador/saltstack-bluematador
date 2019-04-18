install blue matador agent:
  pkgrepo.managed:
    - humanname: Blue Matador Agent
    {% if grains['os_family'] == 'Debian' %}
    - name: deb https://apt.bluematador.com stable main
    - keyid: BBED0D5A
    - keyserver: hkp://keyserver.ubuntu.com:80
    {% elif grains['os_family'] == 'RedHat' %}
    - baseurl: http://yum.bluematador.com/
    - gpgkey: http://yum.bluematador.com/OPSBUNKER_RPM_KEY.public
    {% endif %}
  pkg.installed:
    - pkgs:
      {% if grains['os_family'] == 'Debian' %}
      - apt-transport-https
      {% endif %}
      - bluematador-agent

create config file:
  file.managed:
    - name: /etc/bluematador-agent/config.ini
    - template: jinja
    - source: salt://bluematador/files/config.ini
    - user: root
    - group: root
    - mode: 440
    - makedirs: True

run blue matador:
  service.running:
    - enable: True
    - name: bluematador-agent

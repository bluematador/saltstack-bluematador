create config file:
  file.managed:
    - name: /etc/bluematador-agent/config.ini
    - template: jinja
    - source: salt://bluematador/files/config.ini
    - user: root
    - group: root
    - mode: 440
    - makedirs: True

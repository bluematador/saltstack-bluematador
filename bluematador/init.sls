/etc/bluematador-agent/config.ini:
  file.managed:
    - template: jinja
    - source: salt://bluematador/files/config.ini
    - user: root
    - group: root
    - mode: 440

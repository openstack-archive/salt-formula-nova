include:
  - .compute_single
  - .control_single

nova:
  controller:
    database:
      ssl:
        enabled: True
    message_queue:
      port: 5671
      ssl:
        enabled: True
  compute:
    database:
      ssl:
        enabled: True
    message_queue:
      port: 5671
      ssl:
        enabled: True

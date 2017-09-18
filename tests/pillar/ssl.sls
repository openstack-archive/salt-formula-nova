include:
  - .compute_single
  - .control_single

nova:
  controller:
    message_queue:
      port: 5671
      ssl:
        enabled: True
  compute:
    message_queue:
      port: 5671
      ssl:
        enabled: True

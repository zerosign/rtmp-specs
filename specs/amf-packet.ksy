meta:
  id: amf_packet
  title: amf packet structure 
  endian: le
  # imports:
  #   - amf0
  #   - amf3
types:
  header_type_struct:
    seq:
    - id: header_name_length
      type: u2
      doc: |
        header name length to be used in header-name-string

    - id: header_name_string
      type: str
      size: header_name_length
      encoding: UTF-8

    - id: must_understand
      type: u1
      doc: |
        wtf must understand

    - id: header_length
      type: s4
      doc: |
        header length to be used in header message

    - id: header_message
      size: 8 * header_length
      doc: |
        header message in AMF0 or AMF3 format

  message_type_struct:
    seq:
    - id: target_url_length
      type: u2
      doc: |
        target url length

    - id: target_url_string 
      type: str
      size: target_url_length
      encoding: UTF-8

    - id: response_url_length
      type: u2
      doc: | 
        response url length

    - id: response_url_string
      type: str 
      size: response_url_length
      encoding: UTF-8

    - id: message_length
      type: s4 # somehow it use signed integer (simsbf)
      doc: |
        message length 

    - id: message
      size: 8 * message_length
      doc: |
        actual message of AMF0 or AMF3

  amf_packet_struct:
    seq:
    - id: version
      type: u2
      doc: |
        version of AMF packet (0 or 3), 16 bits

    - id: num_header
      type: u2
      doc: |
        integer that represents the number header type structure ahead

    - id: header
      type: header_type_struct
      repeat: expr 
      repeat-expr: num_header
      doc: |
        header type struct instance

    - id: num_message
      type: u2
      doc: |
        message count 

    - id: message
      type: message_type_struct
      repeat: expr 
      repeat-expr: num_message
      doc: |
        message type struct instance



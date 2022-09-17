meta:
  id: amf-packet
  title: amf packet structure 
  endian: le
  imports:
    - amf0
    - amf3
  doc: |
    AMF packet format that encapsulate AMF0 or AMF3 format message
types:
  amf-packet-struct:
    seq:
    - id: version
      type: u8
      size: 2
      doc: |
        version of AMF packet (0 or 3), 16 bits
    - id: header-count
      type: u8
      size: 2 
      doc: |
        integer that represents the number header type structure ahead

  header-type-struct:
    seq:
    - id: header-name-length
      type: u8
      size: 2 
      doc: |
        header name length to be used in header-name-string
    - id: header-name-string
      type: str
      size: header-name-length
      encoding: UTF-8
    - id: must-understand
      type: u8
      size: 1
      doc: |
        wtf must understand
    - id: header-length
      type: s8
      size: 4
      doc: |
        header length to be used in header message
    - id: header-message
      type: u8
      size: message-length
      doc: |
        header message in AMF0 or AMF3 format

  message-type-struct:
    seq:
    - id: target-uri-length
      type: u8
      size: 2
      doc: |
        target url length
    - id: target-uri-string 
      type: str
      size: target-uri-length
      encoding: UTF-8
    - id: response-uri-length
      type: u8
      size: 2
      doc: | 
        response url length
    - id: response-url-string
      type: str 
      size: response-url-length
      encoding: UTF-8
    - id: message-length
      type: s8 # somehow it use signed integer (simsbf)
      size: 4 
      doc: |
        message length 
    - id: message
      type: u8
      size: message-length
      doc: |
        actual message of AMF0 or AMF3


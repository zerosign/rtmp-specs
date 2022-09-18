meta:
  id: amf0-structure
  title: amf0 message structure definition
  endian: le
  doc: |
    AMF0 structure definition
types:
  amf0_message:
    seq:
    - id: amf0_message_start
      contents: [0x03]

  amf0_key_pair:
    seq:
    - id: 
      

enums:
  - amf0_type:
    0x00: number_type
    0x01: boolean_type
    0x02: str_type
    0x03: object_type
    0x05: null_type
    0x08: ecma_array_type
    0x09: object_end_type
    0x0a: strict_array_type
    0x0b: date_type
    0x0c: long_str_type 
    0x0f: xml_doc_type
    0x10: typed_object_type
    0x11: amf3_type

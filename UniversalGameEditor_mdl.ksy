meta:
  id: uge_mdl
  file-extension: MDL
  application: UGE Universal Game Editor
  endian: le 
  license: CC0-1.0
doc-ref: 'https://www.zophar.net/utilities/gencheat/uge-module-reader-file-editor.html'
seq:
  - id: entries
    type: var_def
    repeat: expr
    repeat-expr: 10
types:
  var_def:
    seq:
      - id: name_size
        type: u1
      - id: variable_name
        type: str
        size: 20
        encoding: ASCII
      - id: lng_file_address
        type: u4
      - id: byt_var_type
        type: u1
        enum: var_type
enums:
      var_type:
        0: signed_byte
        1: string_1
        2: string_2
        3: string_3
        4: string_4
        5: string_5
        6: string_6
        7: string_7
        8: string_8
        9: string_9
        10: string_10
        11: string_11
        12: string_12
        13: string_13
        14: string_14
        15: string_15
        16: string_16
        17: string_17
        18: string_18
        19: string_19
        20: string_20
        252: signed_long
        253: uint
        254: int
        255: unsigned_short
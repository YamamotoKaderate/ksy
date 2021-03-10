meta:
  id: commandos_dir
  file-extension: dir
  title: Commandos files archive
  application: Commandos Behind Ennemy Lines
  endian: le 
  license: CC0-1.0
doc-ref: 'http://rewiki.regengedanken.de/wiki/.DIR_(Commandos)'
seq:
  - id: root
    type: dir_begin
types:
  dir_begin:
    seq:
    - id: entry_name
      type: str
      encoding: ascii
      size: 32
      doc: header of some kind, mostly filled with zeroes
    - id: typ
      type: u1
      enum: entry_type
      doc: type (1 = directory, 0 = file, -1 = end of directory)
    - id: entry_end
      type:
        switch-on: typ
        cases:
          'entry_type::directory': dir_decl
          'entry_type::file': file
          'entry_type::end_of_directory': dir_close
    - id: next
      type: dir_begin
      if: typ != entry_type::end_of_directory
  dir_decl:
    seq:
    - id: unknow1
      type: u1
    - id: unknow2
      type: u1
    - id: unknow3
      type: u1
    - id: size
      type: u4
    - id: offset
      type: u4
    instances:
      sub_entry:
        id: sub
        type: dir_begin
        io: _root._io
        pos: offset
  file:
    seq:
    - id: unknow1
      type: u1
    - id: unknow2
      type: u1
    - id: unknow3
      type: u1
    - id: size
      type: u4
    - id: offset
      type: u4
    instances:
      file_contents:
        io: _root._io
        pos: offset
        size: size
  dir_close:
    seq:
    - id: unknow1
      type: u1
    - id: unknow2
      type: u1
    - id: unknow3
      type: u1
    - id: size
      type: u4
    - id: offset
      type: u4
enums:
  entry_type:
    0x1: directory
    0x0: file
    0xff: end_of_directory

  
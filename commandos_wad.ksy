meta:
  id: commandos_wad
  file-extension: wad
  title: Commandos sprites & palettes archive
  application: Commandos Behind Ennemy Lines
  endian: le 
  license: CC0-1.0
doc-ref: 'http://rewiki.regengedanken.de/wiki/.WAD'
seq:
  - id: header
    size: 400
    doc: header of some kind, mostly filled with zeroes
  - id: number_of_palettes
    type: u4
    doc: number of entries in palette table
  - id: palette_table
    type: palette_entry
    repeat: expr
    repeat-expr: number_of_palettes
  - id: number_of_sprites
    type: u4
    doc: number of sprites
  - id: sprite_table
    type: sprite_entry
    repeat: expr
    repeat-expr: number_of_sprites
types:
  palette_entry:
    seq:
      - id: header
        size: 512
        doc: palette
      - id: unknow
        size: 13
        doc: unkow data
  sprite_entry:
    seq:
      - id: name
        type: str 
        size: 32    
        encoding: "ascii"
        doc: name of the file - string, padded with zeroes
      - id: size
        type: u4
        doc: size - length of file data
      - id: unknow1
        type: u4
      - id: unknow2
        type: u4
      - id: unknow3
        type: u4
      - id: height
        type: u4
        doc: height, pixels
      - id: width
        type: u4
        doc: width, pixels
      - id: unknow4
        type: u4
      - id: flags
        type: u4
        doc: flags (either 0 for .BMP or 4 for .RLE files (which also contain row offset table))
      - id: data
        size: size
        doc: data (file contents, "size" bytes)
      - id: size2
        type: u4
        if: flags == 0x4
        doc: size of row offset table
      - id: offset_table
        type: rle_offset
        if: flags == 0x4
      - id: palette_index
        type: u4
  rle_offset:
    seq:
      - id: offset_name
        type: str 
        size: 4    
        encoding: "ascii"
        doc: name (string, non zero-terminated; usually lowercase, resembling corresponding file name)
      - id: width
        type: u4
        doc: width, pixels
      - id: height
        type: u4
        doc: height, pixels
      - id: single_row_offset
        type: u4
        repeat: expr
        repeat-expr: height
        
meta:
  id: th06
  file-extension: rpy
  endian: le
seq:
  - id: magic
    contents: T6RP
  - id: version
    size: 2
  - id: shot
    type: u1
    valid:
      min: 0
      max: 3
  - id: difficulty
    type: u1
    valid:
      min: 0
      max: 4
  - id: checksum
    type: u4
  - id: rng1
    type: u1
  - id: rng2
    type: u1
  - id: key
    type: u1
  - id: rng3
    type: u1
  - id: date
    type: str
    size: 9
    encoding: ASCII
    terminator: 0x0
  - id: name
    type: str
    size: 9
    encoding: Shift_JIS
    terminator: 0x0
  - id: unknown_3
    type: u2
  - id: score
    type: u4
  - id: slowdown2
    type: f4
    doc: slowdown2 = slowdown + 1.12
  - id: slowdown
    type: f4
    doc: Slowdown rate
  - id: slowdown3
    type: f4
    doc: slowdown3 = slowdown = 2.34
  - id: stage_offsets
    type: stage_pointer
    repeat: expr
    repeat-expr: 7
types:
  stage_pointer:
    seq:
      - id: offset
        doc: Absolute offset to stage blocks
        type: u4
    instances:
      # See https://github.com/kaitai-io/kaitai_struct/issues/14
      # for an explanation of this pattern.
      stage:
        io: _root._io
        pos: offset
        type: stage
        if: offset != 0
  stage:
    seq:
      - id: score
        type: u4
      - id: seed
        type: u2
      - id: unknown_1
        type: u2
      - id: power
        type: u1
      - id: lives
        type: s1
      - id: bombs
        type: s1
      - id: rank
        type: u1

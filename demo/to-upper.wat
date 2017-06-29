(module
  (memory (export "memory") 10 10)
  (func (export "toUpper") (param $ptr i32) (param $ptr_end i32)
    (block $end_loop
      (loop $start_loop
        (br_if $end_loop (i32.eq (get_local $ptr) (get_local $ptr_end)))
        (i32.store8
          (get_local $ptr)
          (i32.sub (i32.load8_u (get_local $ptr)) (i32.const 32))
        )
        (set_local $ptr (i32.add (get_local $ptr) (i32.const 1)))
        (br $start_loop)
      )
    )
  )
  (func (export "toUpperFast") (param $ptr i32) (param $ptr_end i32)
    (block $end_loop
      (loop $start_loop
        (br_if $end_loop (i32.ge_u (get_local $ptr) (get_local $ptr_end)))
        (i64.store
          (get_local $ptr)
          (i64.sub (i64.load (get_local $ptr)) (i64.const 0x2020202020202020))
        )
        (set_local $ptr (i32.add (get_local $ptr) (i32.const 8)))
        (br $start_loop)
      )
    )
  )
)

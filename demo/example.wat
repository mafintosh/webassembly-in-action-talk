(module
  (func $add (export "add") (param $a i32) (param $c i32) (result i32)
    (return
      (i32.add
        (get_local $a)
        (get_local $c)
      )
    )
  )
)

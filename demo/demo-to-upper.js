var toUpper = require('./to-upper')

var wasm = toUpper()

var buf = Buffer.from(process.argv[2] || 'hellodublinhowareyou')

wasm.memory.set(buf)
wasm.exports.toUpperFast(0, buf.length)

var out = Buffer.from(wasm.memory.subarray(0, buf.length))

console.log(out.toString())

var fs = require('fs')

var wasm = fs.readFileSync('example.wasm')
var instance = new WebAssembly.Instance(new WebAssembly.Module(wasm))

console.log(instance.exports.add(1, 2))

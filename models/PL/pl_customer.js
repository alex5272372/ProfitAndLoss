const __entityName = __filename.slice(__dirname.length + 1, -3)
const me = global[__entityName]

me.on('insert:before', beforeInsert)
me.on('update:before', beforeUpdate)

function beforeInsert (ctx) {
  console.log('before insert')
}

function beforeUpdate (ctx) {
  console.log('before update')
}

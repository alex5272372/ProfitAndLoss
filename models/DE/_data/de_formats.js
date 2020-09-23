const { extend } = require('@unitybase/ub-migrate')

/**
 * @param {Container} container
 */
module.exports = function (container) {
  /* extend.registerEntity(
    entityName,
    keyAttributes,
    regularAttributes,
    translatableAttributes,
    lookupAttributes,
    nonUpdatableAttributes
  ) */
  extend.registerEntity(
    'de_model',
    ['name']
  )
  extend.registerEntity(
    'de_entity',
    ['name'],
    [],
    [],
    [{ repository: 'de_model', attribute: 'parentModel', targetAttribute: 'parentModel' }]
  )
}

const {
  EntityFormat,
  EntityRepository
} = require('@unitybase/ub-migrate').extend

module.exports = function (container) {
  /* new EntityRepository(
    entityName,
    keyAttributes,
    regularAttributes,
    translatableAttributes,
    lookupAttributes,
    nonUpdatableAttributes
  ) */

  container.registerRepository(
    new EntityRepository(
      'de_model',
      ['name']
    )
  )

  container.registerRepository(
    new EntityRepository(
      'de_entity',
      ['name'],
      [],
      [],
      [{
        repository: container.getRepository('de_model'),
        attribute: 'model',
        targetAttribute: 'parentModel'
      }]
    )
  )

  container.registerRepository(
    new EntityRepository(
      'de_attribute',
      ['name'],
      [],
      [],
      [{
        repository: container.getRepository('de_entity'),
        attribute: 'entity',
        targetAttribute: 'parentEntity'
      }]
    )
  )

  const mdAttribute = new EntityFormat()
    .key('name')
    .fromContext('entity')
    .wrapAsEntity('de_attribute')

  const mdEntity = new EntityFormat()
    .key('name')
    .fromContext('model')
    .child(
      'attributes',
      {
        context: {
          entity: 'name'
        },
        metadata: mdAttribute
      }
    )
    .wrapAsEntity('de_entity')

  const mdModel = new EntityFormat()
    .key('name')
    .child(
      'entities',
      {
        context: {
          model: 'name'
        },
        metadata: mdEntity
      }
    )
    .wrapAsEntity('de_model')

  container.registerFileType('de_entity', mdEntity)
  container.registerFileType('de_model', mdModel)
}

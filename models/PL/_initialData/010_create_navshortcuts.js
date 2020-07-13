module.exports = session => {
  const { connection } = session
  // In the ubm_desktop table look for the desktop with the code full_desktop
  let desktopID = connection.lookup('ubm_desktop', 'ID', {
    expression: 'code',
    condition: 'equal',
    values: { code: 'full_desktop' }
  })

  console.info('\tFill `Full` desktop')
  if (!desktopID) { //If not found, create a new
    console.info('\t\tcreate new `Full` desktop')
    desktopID = connection.insert({
      entity: 'ubm_desktop',
      fieldList: ['ID'],
      execParams: {
        code: 'full_desktop',
        caption: 'Повний'
      }
    })
  } else { //else display a message
    console.info('\t\tuse existed desktop with code `full_desktop`', desktopID)
  }

  let folderID = connection.lookup('ubm_navshortcut', 'ID', {
    expression: 'code',
    condition: 'equal',
    values: { code: 'pl_dict_folder' }
  })
  if (!folderID) {
    console.log('\t\tcreate `Dictionaries` folder')
    folderID = connection.insert({
      entity: 'ubm_navshortcut',
      fieldList: ['ID'],
      execParams: {
        desktopID,
        code: 'pl_dict_folder',
        caption: 'Довідники',
        isFolder: true,
        isCollapsed: false,
        displayOrder: 10
      }
    })
  } else {
    console.info('\t\tuse existed folder with code `pl_dict_folder`', folderID)
  }

  let customerID = connection.lookup('ubm_navshortcut', 'ID', {
    expression: 'code',
    condition: 'equal',
    values: { code: 'pl_customer' }
  })
  if (!customerID) {
    console.log('\t\t\tcreate `Customer` shortcut')
    customerID = connection.insert({
      fieldList: ['ID'],
      entity: 'ubm_navshortcut',
      execParams: {
        desktopID,
        parentID: folderID,
        code: 'pl_customer',
        caption: 'Контрагенти',
        iconCls: 'fa fa-building-o',
        displayOrder: 10,
        cmdCode: JSON.stringify({ cmdType: 'showList', cmdData: { params: [{ entity: 'pl_customer', fieldList: '*' }] } })
      }
    })
  } else {
    console.info('\t\tuse existed shortcut with code `pl_customer`', customerID)
  }

  let employeeID = connection.lookup('ubm_navshortcut', 'ID', {
    expression: 'code',
    condition: 'equal',
    values: { code: 'pl_employee' }
  })
  if (!employeeID) {
    console.log('\t\t\tcreate `Employee` shortcut')
    employeeID = connection.insert({
      fieldList: ['ID'],
      entity: 'ubm_navshortcut',
      execParams: {
        desktopID,
        parentID: folderID,
        code: 'pl_employee',
        caption: 'Працівники',
        iconCls: 'fa fa-building-o',
        displayOrder: 10,
        cmdCode: JSON.stringify({ cmdType: 'showList', cmdData: { params: [{ entity: 'pl_employee', fieldList: '*' }] } })
      }
    })
  } else {
    console.info('\t\tuse existed shortcut with code `pl_employee`', employeeID)
  }

  let organizationID = connection.lookup('ubm_navshortcut', 'ID', {
    expression: 'code',
    condition: 'equal',
    values: { code: 'pl_organization' }
  })
  if (!organizationID) {
    console.log('\t\t\tcreate `Organization` shortcut')
    organizationID = connection.insert({
      fieldList: ['ID'],
      entity: 'ubm_navshortcut',
      execParams: {
        desktopID,
        parentID: folderID,
        code: 'pl_organization',
        caption: 'Організації',
        iconCls: 'fa fa-building-o',
        displayOrder: 10,
        cmdCode: JSON.stringify({ cmdType: 'showList', cmdData: { params: [{ entity: 'pl_organization', fieldList: '*' }] } })
      }
    })
  } else {
    console.info('\t\tuse existed shortcut with code `pl_organization`', organizationID)
  }

  let productID = connection.lookup('ubm_navshortcut', 'ID', {
    expression: 'code',
    condition: 'equal',
    values: { code: 'pl_product' }
  })
  if (!productID) {
    console.log('\t\t\tcreate `Product` shortcut')
    productID = connection.insert({
      fieldList: ['ID'],
      entity: 'ubm_navshortcut',
      execParams: {
        desktopID,
        parentID: folderID,
        code: 'pl_product',
        caption: 'Номенклатура',
        iconCls: 'fa fa-building-o',
        displayOrder: 10,
        cmdCode: JSON.stringify({ cmdType: 'showList', cmdData: { params: [{ entity: 'pl_product', fieldList: '*' }] } })
      }
    })
  } else {
    console.info('\t\tuse existed shortcut with code `pl_product`', productID)
  }
}

module.exports = session => {
  const { connection } = session
  // In the ubm_desktop table look for the desktop with the code CityReq_desktop
  let desktopID = connection.lookup('ubm_desktop', 'ID', {
    expression: 'code',
    condition: 'equal',
    values: { code: 'CityReq_desktop' }
  })

  console.info('\tFill `Common dictionary` desktop')
  if (!desktopID) { //If not found, create a new
    console.info('\t\tcreate new `City request` desktop')
    desktopID = connection.insert({
      entity: 'ubm_desktop',
      fieldList: ['ID'],
      execParams: {
        code: 'CityReq_desktop',
        caption: 'City Requests'
      }
    })
  } else { //else display a message
    console.info('\t\tuse existed desktop with code `CityReq_desktop`', desktopID)
  }

  let folderID = connection.lookup('ubm_navshortcut', 'ID', {
    expression: 'code',
    condition: 'equal',
    values: { code: 'req_departments_folder' }
  })
  if (!folderID) {
    console.log('\t\tcreate `Departments` folder')
    folderID = connection.insert({
      entity: 'ubm_navshortcut',
      fieldList: ['ID'],
      execParams: {
        desktopID,
        code: 'req_departments_folder',
        caption: 'Departments',
        isFolder: true,
        isCollapsed: false,
        displayOrder: 10
      }
    })
  } else {
    console.info('\t\tuse existed folder with code `req_departments_folder`', folderID)
  }

  let departID = connection.lookup('ubm_navshortcut', 'ID', {
    expression: 'code',
    condition: 'equal',
    values: { code: 'req_depart' }
  })
  if (!departID) {
    console.log('\t\t\tcreate `Department` shortcut')
    departID = connection.insert({
      fieldList: ['ID'],
      entity: 'ubm_navshortcut',
      execParams: {
        desktopID,
        parentID: folderID,
        code: 'req_depart',
        caption: 'Departments',
        iconCls: 'fa fa-building-o',
        displayOrder: 10,
        cmdCode: JSON.stringify({ cmdType: 'showList', cmdData: { params: [{ entity: 'req_depart', fieldList: '*' }] } })
      }
    })
  } else {
    console.info('\t\tuse existed shortcut with code `req_depart`', departID)
  }

  let subDepartID = connection.lookup('ubm_navshortcut', 'ID', {
    expression: 'code',
    condition: 'equal',
    values: { code: 'req_subDepart' }
  })
  if (!subDepartID) {
    console.log('\t\t\tcreate `SubDepartments` shortcut')
    subDepartID = connection.insert({
      fieldList: ['ID'],
      entity: 'ubm_navshortcut',
      execParams: {
        desktopID,
        parentID: folderID,
        code: 'req_subDepart',
        caption: 'SubDepartments',
        iconCls: 'fa fa-building-o',
        displayOrder: 10,
        cmdCode: JSON.stringify({ cmdType: 'showList', cmdData: { params: [{ entity: 'req_subDepart', fieldList: '*' }] } })
      }
    })
  } else {
    console.info('\t\tuse existed shortcut with code `req_subDepart`', subDepartID)
  }

  let reqListID = connection.lookup('ubm_navshortcut', 'ID', {
    expression: 'code',
    condition: 'equal',
    values: { code: 'req_reqList' }
  })
  if (!reqListID) {
    console.log('\t\t\tcreate `Request List` shortcut')
    reqListID = connection.insert({
      fieldList: ['ID'],
      entity: 'ubm_navshortcut',
      execParams: {
        desktopID,
        code: 'req_reqList',
        caption: 'Request List',
        iconCls: 'fa fa-building-o',
        displayOrder: 10,
        cmdCode: JSON.stringify({ cmdType: 'showList', cmdData: { params: [{ entity: 'req_reqList', fieldList: '*' }] } })
      }
    })
  } else {
    console.info('\t\tuse existed shortcut with code `req_reqList`', reqListID)
  }
}

const desktops = {
  adm_desktop: {
    adm_folder_users: {
      uba_user: false,
      uba_userrole: false,
      uba_group: false,
      uba_usergroup: false
    }
  },
  full_desktop: {
    pl_dict_folder: {
      pl_customer: false,
      pl_employee: false,
      pl_organization: false,
      pl_product: false
    }
  }
}

const captions = {
  adm_desktop: 'Адміністратор',
  adm_folder_users: 'Користувачі',
  uba_user: 'Список користувачів',
  uba_userrole: 'Ролі користувачів',
  uba_group: 'Список груп',
  uba_usergroup: 'Групи користувачів',
  full_desktop: 'Повний',
  pl_dict_folder: 'Довідники',
  pl_customer: 'Контрагенти',
  pl_employee: 'Працівники',
  pl_organization: 'Організації',
  pl_product: 'Номенклатура'
}

const iconCls = {
  adm_folder_users: 'fa fa-user',
  uba_user: 'fa fa-user-secret',
  uba_group: 'fa fa-group'
}

function insertNavshortcut(connection, navshortcut, desktopID, code, parentID) {
  let navshortcutID = connection.lookup('ubm_navshortcut', 'ID', {
    expression: 'code',
    condition: 'equal',
    values: { code }
  })

  if (navshortcut) {
    if (!navshortcutID) {
      console.log('\tcreate `%s` folder', code)
      navshortcutID = connection.insert({
        entity: 'ubm_navshortcut',
        fieldList: ['ID'],
        execParams: {
          desktopID,
          code,
          caption: captions[code],
          iconCls: iconCls[code],
          isFolder: true,
          isCollapsed: false,
          displayOrder: 10
        }
      })
    } else {
      console.log('\tuse existed folder with code `%s`', code)
    }
    Object.keys(navshortcut)
      .forEach(childCode => insertNavshortcut(connection, navshortcut[childCode], desktopID, childCode, navshortcutID))

  } else {
    if (!navshortcutID) {
      console.log('\tcreate `%s` shortcut', code)
      connection.insert({
        fieldList: ['ID'],
        entity: 'ubm_navshortcut',
        execParams: {
          desktopID,
          parentID,
          code,
          caption: captions[code],
          iconCls: iconCls[code],
          displayOrder: 10,
          cmdCode: JSON.stringify({
            cmdType: 'showList',
            cmdData: {
              params: [{
                entity: code,
                fieldList: '*'
              }]
            }
          })
        }
      })
    } else {
      console.log('\tuse existed shortcut with code `%s`', code)
    }
  }
}

module.exports = session => {
  const { connection } = session
  
  Object.keys(desktops).forEach(desktopCode => {
    let desktopID = connection.lookup('ubm_desktop', 'ID', {
      expression: 'code',
      condition: 'equal',
      values: { code: desktopCode }
    })

    console.log('Fill `%s` desktop', desktopCode)
    if (!desktopID) {
      console.log('\tcreate new `%s` desktop', desktopCode)
      desktopID = connection.insert({
        entity: 'ubm_desktop',
        fieldList: ['ID'],
        execParams: {
          code: desktopCode,
          caption: captions[desktopCode]
        }
      })
    } else {
      console.log('\tuse existed desktop with code `%s`', desktopCode)
    }

    Object.keys(desktops[desktopCode])
      .forEach(code => insertNavshortcut(connection, desktops[desktopCode][code], desktopID, code))
  })
}

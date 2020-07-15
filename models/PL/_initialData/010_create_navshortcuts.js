const desktops = {
  adm_desktop: ['Адміністратор', 'fas fa-user-cog', {
    adm_folder_users: ['Користувачі', 'fa fa-user', {
      uba_user: ['Список користувачів', 'fa fa-user'],
      uba_userrole: ['Ролі користувачів', ''],
      uba_group: ['Список груп', 'fa fa-group'],
      uba_usergroup: ['Групи користувачів', '']
    }],
    adm_folder_security: ['Безпека', '', {
      uba_role: ['Системні ролі', 'fa fa-users'],
      uba_els: ['Права на методи', '']
    }],
    adm_folder_UI: ['Інтерфейс', 'fa fa-picture-o', {
      ubm_enum: ['Переліки', ''],
      ubm_desktop: ['Робочі столи', ''],
      ubm_navshortcut: ['Ярлики', '']
    }]
  }],
  full_desktop: ['Повний', 'u-icon-desktop', {
    pl_folder_organization: ['Організації', '', {
      org_organization: ['Власні організації', ''],
      org_department: ['Підрозділи організації', ''],
      org_employee: ['Співробітники організації', ''],
      cdn_organization: ['Зовнішні організації', '']
    }],
    pl_folder_dict: ['Довідники', '', {
      pl_product: ['Номенклатура', ''],
      cdn_address: ['Адреси', ''],
      cdn_person: ['Фізичні особи', ''],
      cdn_profession: ['Професії', '']
    }]
  }]
}
let displayOrder = 0

function insertNavshortcut(connection, navshortcut, desktopID, code, parentID) {
  let navshortcutID = connection.lookup('ubm_navshortcut', 'ID', {
    expression: 'code',
    condition: 'equal',
    values: { code }
  })

  if (navshortcut[2]) {
    if (!navshortcutID) {
      console.log('\tcreate `%s` folder', code)
      displayOrder += 10
      navshortcutID = connection.insert({
        entity: 'ubm_navshortcut',
        fieldList: ['ID'],
        execParams: {
          desktopID,
          code,
          caption: navshortcut[0],
          iconCls: navshortcut[1],
          isFolder: true,
          isCollapsed: false,
          displayOrder
        }
      })
    } else {
      console.log('\tuse existed folder with code `%s`', code)
    }
    Object.keys(navshortcut[2])
      .forEach(childCode => insertNavshortcut(connection, navshortcut[2][childCode], desktopID, childCode, navshortcutID))

  } else {
    if (!navshortcutID) {
      console.log('\tcreate `%s` shortcut', code)
      displayOrder += 10
      connection.insert({
        fieldList: ['ID'],
        entity: 'ubm_navshortcut',
        execParams: {
          desktopID,
          parentID,
          code,
          caption: navshortcut[0],
          iconCls: navshortcut[1],
          displayOrder,
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
          caption: desktops[desktopCode][0],
          iconCls: desktops[desktopCode][1]
        }
      })
    } else {
      console.log('\tuse existed desktop with code `%s`', desktopCode)
    }

    Object.keys(desktops[desktopCode][2])
      .forEach(code => insertNavshortcut(connection, desktops[desktopCode][2][code], desktopID, code))
  })
}

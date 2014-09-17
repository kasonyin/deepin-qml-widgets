import QtQuick 2.1
import DBus.Com.Deepin.Menu 1.0

Item {
	id: root_item
	property bool canCopy: true
	property bool canCut: true
	property bool canPaste: true
	property bool canReset: true

	signal copyClicked
	signal cutClicked
	signal pasteClicked
	signal resetClicked

	MenuManager { id: manager; path: "/com/deepin/menu" }
	MenuObject {
		id: menu

		onItemInvoked: {
			switch(itemId) {
				case "copy":
				root_item.copyClicked(); break
				case "cut":
				root_item.cutClicked(); break
				case "paste":
				root_item.pasteClicked(); break
				case "reset":
				root_item.resetClicked(); break
			}
		}
	}

	function show(x, y) {
		menu.path = manager.RegisterMenu()
		var menuCopy = {
			"itemId": "copy",
			"itemIcon": "",
			"itemIconHover": "",
			"itemIconInactive": "",
			"itemText": "Copy",
			"isActive": canCopy,
			"checked": false,
			"itemSubMenu": {}
		}
		var menuCut = {
			"itemId": "cut",
			"itemIcon": "",
			"itemIconHover": "",
			"itemIconInactive": "",
			"itemText": "Cut",
			"isActive": canCut,
			"checked": false,
			"itemSubMenu": {}
		}
		var menuPaste = {
			"itemId": "paste",
			"itemIcon": "",
			"itemIconHover": "",
			"itemIconInactive": "",
			"itemText": "Paste",
			"isActive": canPaste,
			"checked": false,
			"itemSubMenu": {}
		}
		var menuReset = {
			"itemId": "reset",
			"itemIcon": "",
			"itemIconHover": "",
			"itemIconInactive": "",
			"itemText": "Reset",
			"isActive": canReset,
			"checked": false,
			"itemSubMenu": {}
		}

		var menuJson = {
			"x": x, "y": y, "isDockMenu": false,
			"menuJsonContent": JSON.stringify({
				"items": [
				menuCopy,
				menuCut,
				menuPaste,
				menuReset
				]
				})
		}

		menu.ShowMenu(JSON.stringify(menuJson))
	}
}
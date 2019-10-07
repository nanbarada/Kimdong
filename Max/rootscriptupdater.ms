(
files = getFiles "A:\*.ms"
sort files

if ((menuMan.findMenu "RootScript") != undefined) then 
(
	menuMan.unRegisterMenu (menuMan.findMenu "RootScript")
	menuMan.updateMenuBar()
)

mainMenuBar = menuMan.getMainMenuBar()
subMenu = menuMan.createMenu "RootScript"
	
ii = 0
for i in files do 
(
	ii = ii + 1
	str = "macroscript smartmenu" + (ii as string) + " category:\"smartmenu\" buttontext:\"" + (getFilenameFile i) + "\" (execute (openFile \"" + i + "\"))"
	execute str	

	testItem = menuMan.createActionItem ("smartmenu" + (ii as string)) "smartmenu"
	subMenu.addItem testItem -1	
)

subMenuItem = menuMan.createSubMenuItem "Test Menu" subMenu
subMenuIndex = mainMenuBar.numItems() - 1
mainMenuBar.addItem subMenuItem subMenuIndex
menuMan.updateMenuBar()

)

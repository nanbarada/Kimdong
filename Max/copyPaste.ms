rollout unnamedRollout "Copy & Paste Tool" width:139 height:130
(
	button 'btn2' "Copy" pos:[10,12] width:118 height:45 align:#left
	button 'btn3' "Paste" pos:[12,69] width:117 height:48 align:#left
	on btn2 pressed  do
		saveNodes $ "\\\\192.168.0.50\\Backup\\MaxScripts\\cash.max"
	on btn3 pressed  do
		mergemaxfile "\\\\192.168.0.50\\Backup\\MaxScripts\\cash.max"
)

testfloater = newrolloutfloater "copy&paste" 150 150;
addrollout unnamedRollout testfloater;
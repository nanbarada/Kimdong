/*
	SmartIncludeExclude v.1.2 [2010-02-10/16]
	by Anubis [project3d.narod.ru]
	v.1.1 - added I/E Type toggle
	v.1.2 - added Clean I/E List button

Select your objects and lights, choose I/E ops and check "Transfer..."
(if you like) to move existing obj(s) into the new I/E List.
Works on all geometry + renderable shapes (as original I/E feature designed).

Tips:
[*] Just to transfer obj(s) b/w I/E lists - select lights only and check "Transfer..."
[*] Just to clean-up I/E list - select lights only and uncheck "Transfer..."
[*] "Clean" button will empty the I/E list keeping the rest I/E settings intact.

*/
if ro_sInclExcl != undefined do destroyDialog ro_sInclExcl
rollout ro_sInclExcl "Include/Exclude Lights"
(
	fn smartInclExcl inclExcl ieType keep:false = (
		geos = for g in geometry where g.isSelected collect g
		for s in shapes where s.isSelected do -- include Renderable Shapes as well
			if s.render_renderable == true do append geos s
		-- get supported lights
		lums = for l in lights where l.isSelected and \
			isProperty l #excludeList collect l
		case inclExcl of (
			1: (
				for lt in lums do (
					if lt.includeList == undefined do (
						if keep then lt.includeList = lt.excludeList
							else lt.includeList = #()
					)
					temp = lt.includeList
					join temp geos
					lt.includeList = temp
					-- Type toggle
					if isProperty lt #inclExclType do
						lt.inclExclType = ieType
				)
			)
			2: (
				for lt in lums do (
					if lt.excludeList == undefined do (
						if keep then lt.excludeList = lt.includeList
							else lt.excludeList = #()
					)
					temp = lt.excludeList
					join temp geos
					lt.excludeList = temp
					-- Type toggle
					if isProperty lt #inclExclType do
						lt.inclExclType = ieType
				)
			)
		)
	)
	fn cleanIncExcList = (
		lums = for l in lights where l.isSelected and \
			isProperty l #excludeList collect l
		for lt in lums do (
			if lt.includeList != undefined do lt.includeList = #()
			if lt.excludeList != undefined do lt.excludeList = #()
		)
	)
	
	checkBox chb_keep "Transfer Objects To..." checked:true
	radioButtons rbt_InEx labels:#("Include ","Exclude") align:#left
	button btn_run "OK" width:50 height:40 pos:[145,6]
	group "I/E Type Toggle"
	(
		radioButtons rbt_type labels:#("Illumin.","Shadow","Both") default:3 columns:3 align:#left
	)
	group "Usage Note"
	(
		label info "Work On Selected Objects + Lights"
	)
	button btn_clean "Clean Include/Exclude List" width:180
	
	on btn_run pressed do
	(smartInclExcl rbt_InEx.state rbt_type.state keep:chb_keep.checked)
	on btn_clean pressed do (cleanIncExcList())
)
createDialog ro_sInclExcl 200 168
-- eof
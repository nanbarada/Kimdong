try(DestroyDialog RL_UiTest)catch()
rollout Rootremocon "Root RemoteCon UI"
(
	Global FolderPath = " "
	Global BG_matt_Path = "Y:\p29_vroomiz\source\bg"
	Global CH_Matt_Path = "Y:\p29_vroomiz\source\matt"
	Global Animation_Path = "X:\p29_vroomiz\season03\p1_eps"
	Global Lim_Light_Path = "Y:\p29_vroomiz\source\matt\Base_set_file"

	-------------------------------------------------------------------- UI 
	
	label lbl_A "Root Final"
    dropdownlist project_A "Select Project" items:#("Y:\p29_vroomiz\source\bg","Not_Yet","B:\Dino")
	on project_A selected sel do
	(
    ----------------------------- print ("The selection number was:" + sel as string)
    FolderPath = project_A.selected
	project_A.selected
	print FolderPath
	)
    -----------------------------   -----------------------------   ----------------------------- 
	button btn_Custom "Custom Folder"
	on btn_Custom pressed  do
	(
		FolderPath = getSavePath "Save to:" initialDir:"" as string
	)
    -----------------------------   -----------------------------   ----------------------------- 	
	button BGButton "Load BG Matt" pos:[4,95] width:76 height:28
	on BGButton pressed  do
	(
		theDialog = dotNetObject "System.Windows.Forms.OpenFileDialog"
		theDialog.title = "Select BG Matt File" 
		theDialog.Filter = "Max Files (*.Max)|*.Max|All Files (*.*)|*.*" 
		theDialog.FilterIndex = 2 
		Print FolderPath
		theDialog.InitialDirectory = BG_matt_Path
		result = theDialog.showDialog() 
		result.ToString() 
		result.Equals result.OK
		BGFilenames = theDialog.fileNames 
		result.Equals result.Cancel 
		If BGFilenames[1] != undefined then 
		(
			print BGFilenames
			loadmaxfile BGFilenames[1]
		)
	)
	-----------------------------   -----------------------------   ----------------------------- 
		button CHButton "Load CH Matt" pos:[84,95] width:76 height:28
	on CHButton pressed  do
	(	
		theDialog = dotNetObject "System.Windows.Forms.OpenFileDialog"
		theDialog.title = "Select CH Matt File" 
		theDialog.Filter = "Max Files (*.Max)|*.Max|All Files (*.*)|*.*" 
		theDialog.FilterIndex = 2 
		print FolderPath
		theDialog.InitialDirectory = CH_Matt_Path
		result = theDialog.showDialog() 
		result.ToString() 
		result.Equals result.OK
		CHFilenames = theDialog.fileNames 
		result.Equals result.Cancel 
		If CHFilenames[1] != undefined then 
		(
			print CHFilenames
			loadmaxfile CHfilenames[1]
		)
	)
    -----------------------------   -----------------------------   ----------------------------- 	
	button AniButton "Animation Merge" width:150 height:28
	on AniButton pressed  do
	(
		theDialog = dotNetObject "System.Windows.Forms.OpenFileDialog"
		theDialog.title = "Select Animation File" 
		theDialog.Filter = "Max Files (*.Max)|*.Max|All Files (*.*)|*.*" 
		theDialog.FilterIndex = 2 
		print AnimationPath
		theDialog.InitialDirectory = Animation_Path
		result = theDialog.showDialog() 
		result.ToString() 
		result.Equals result.OK
		AnimationFileName = theDialog.fileNames 
		result.Equals result.Cancel 
		If AnimationFileName[1] != undefined then 
		(
		MergeMaxFile AnimationFileName[1] 
		)
	)
	button LimButton "Lim light Merge" width:150 height:28
	on LimButton pressed  do
	(
		theDialog = dotNetObject "System.Windows.Forms.OpenFileDialog"
		theDialog.title = "Select Lim light File" 
		theDialog.Filter = "Max Files (*.Max)|*.Max|All Files (*.*)|*.*" 
		theDialog.FilterIndex = 2 
		theDialog.InitialDirectory = Lim_Light_Path
		result = theDialog.showDialog() 
		result.ToString() 
		result.Equals result.OK
		LightFilenames = theDialog.fileNames 
		result.Equals result.Cancel 
		If LightFilenames[1] != undefined then 
		(
		MergeMaxFile LightFilenames[1] 
		)
	)
	-----------------------------   -----------------------------   ----------------------------- 	
	groupBox grp2 "Gogle Trouble Shooting" pos:[6,215] width:150 height:122
	button gmButton "Gogle Position Move" pos:[11,235] width:140 height:28
	on gmButton pressed  do
		(
		undo on
			(
			select $C03_Bungi_helmet_goggle
			actionMan.executeAction 0 "50001"  -- Tools: Select and Move
			max move
			move $ [0,0.1,0.1]
			)
	)
	button gm2Button "Gogle Inner Move" pos:[11,270] width:140 height:28
	on gm2Button pressed  do
		(
		undo on
			(
			select $C03_Bungi_helmet_goggle
			$.modifiers[#TurboSmooth].iterations = 0
			macros.run "Modifier Stack" "Convert_to_Poly"
			subobjectLevel = 1
			$.EditablePoly.SetSelection #Vertex #{20}
			$.EditablePoly.SetSelection #Vertex #{53}
			$.EditablePoly.SetSelection #Vertex #{51, 53}
			$.EditablePoly.SetSelection #Vertex #{50..51, 53}
			$.EditablePoly.SetSelection #Vertex #{44, 50..51, 53}
			$.EditablePoly.SetSelection #Vertex #{44..45, 50..51, 53}
			move $.selectedVerts [0,0.1,0.1]
			macros.run "Modifiers" "TurboSmoothMod"
			$.modifiers[#TurboSmooth].iterations = 2
			select $C03_Bungi_helmet
			$.modifiers[#TurboSmooth].iterations = 2
			)
		)
	button gm3Button "Gogle Entire Move" pos:[11,305] width:140 height:28
	on gm3Button pressed  do
		(
		undo on
			(
			select $C03_Bungi_helmet_goggle
			$.modifiers[#TurboSmooth].iterations = 0
			macros.run "Modifier Stack" "Convert_to_Poly"
			subobjectLevel = 1		
			$.EditablePoly.SetSelection #Vertex #{20, 44..45, 50..51, 53}
			$.EditablePoly.SetSelection #Vertex #{18, 20, 44..45, 50..51, 53}
			$.EditablePoly.SetSelection #Vertex #{17..18, 20, 44..45, 50..51, 53}
			$.EditablePoly.SetSelection #Vertex #{11, 17..18, 20, 44..45, 50..51, 53}
			$.EditablePoly.SetSelection #Vertex #{11..12, 17..18, 20, 44..45, 50..51, 53}
			move $.selectedVerts [0,0.1,0.1]
			macros.run "Modifiers" "TurboSmoothMod"
			$.modifiers[#TurboSmooth].iterations = 2
			select $C03_Bungi_helmet
			$.modifiers[#TurboSmooth].iterations = 2
			)
		)
	groupBox grp3 "Neon Bike Trouble Shooting" pos:[6,355] width:150 height:92		
	button pittyhide "pitty Neon Bike" pos:[11,375] width:140 height:28
	on pittyhide pressed do
		(
		undo on
		(
		select $C02_Mesh_tire_RB
			max hide selection
			select $C02_Mesh_tire_LB
			max hide selection
			select $C02_Mesh_tire_RF
			max hide selection
			select $C02_Mesh_tire_LF
			max hide selection
		)
		)
	-----------------------------   -----------------------------   ----------------------------- 	
	button melong "Mat_ID V-Ray Preset" pos:[11,410] width:140 height:28
		on melong pressed do
		(
		undo on
		(
			vr=renderers.current
			renderSceneDialog.open()
			rendSaveFile = False
			renderers.current.imageSampler_type = 1
			vr.twoLevel_threshold = 0.01
			vr.gi_secondary_type = 0
			vr.dmc_earlyTermination_minSamples = 8
			vr.dmc_earlyTermination_threshold = 0.01
			vr.dmcgi_subdivs = 16
			Renderers.current.filter_kernel = Mitchell_Netravali()
			MainSavePath = getFileNamePath rendOutputFilename
			r = maxOps.GetCurRenderElementMgr()
			r.RemoveAllRenderElements()
			r.AddRenderElement (MultiMatteElement isMATID:true elementname:"005_")
			renderSceneDialog.update()
			y = getMaxSaveFilename()
			saveMaxFile(y)
		)
		)
	-----------------------------   -----------------------------   ----------------------------- 	
     -- checkbox chk_A "Checkbox A"
     -- spinner spn_A "Spinner A" range:[0,10,1] type:#integer
     -- listbox lbx_A "Listbox A" items:#("item1","item2","item3")
     -- edittext edt_A "Edit Text A"
     -- radiobuttons rdo_A "Radiobuttons" labels:#("Option 1", "Option 2")
)
Createdialog Rootremocon
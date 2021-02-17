"Popup_VoxelOutUI_ResultBoardDlg"
{
	"VoxelOutUI_ResultBoardDlg"
	{
		"ControlName"		"CVoxelOutUIResultBoardDlg"
		"fieldName"			"VoxelOutUI_ResultBoardDlg"
		"xpos"				"0"
		"ypos"				"0"
		"wide"				"475"
		"tall"				"291"
		"zpos"				"1"
		"autoResize"		"0"
		"pinCorner"			"0"
		"visible"			"1"
		"enabled"			"1"
		"tabPosition"		"0"
	}

	"PlayedMapTitle_TE"
	{
		"ControlName"			"IMETextEntry"
		"fieldName"				"PlayedMapTitle_TE"
		"xpos"					"17"
		"ypos"					"36"
		"wide"					"433"
		"tall"					"38"
		"zpos"					"1"
		"enabled"				"0"
		"editable"				"0"
		"unicode"				"1"
		"multiline"				"1"
		"visible"				"1"
		"font"					"ChatDefault"
		"EnableForceTextColor"	"1"
		"ForceTextColor"		"168 168 168 255"
		"EnableMouseInput"		"0"		
	}

	"PlayedMapAuthor_Label"
	{
		"ControlName"		"Label"
		"fieldName"			"PlayedMapAuthor_Label"
		"xpos"				"134"
		"ypos"				"84"
		"wide"				"65"
		"tall"				"16"
		"zpos"				"1"
		"visible"			"1"
		"textAlignment"		"center"
		"Font"				"ChatDefault"
		"labelText"			"#Vxl_OutUI_ResultBoard_Author"
	}

	"PlayedMapAuthor_TE"
	{
		"ControlName"			"IMETextEntry"
		"fieldName"				"PlayedMapAuthor_TE"
		"xpos"					"214"
		"ypos"					"84"
		"wide"					"115"
		"tall"					"20"
		"zpos"					"1"
		"enabled"				"0"
		"editable"				"0"
		"unicode"				"1"
		"multiline"				"0"
		"font"					"ChatDefault"
		"EnableForceTextColor"	"1"
		"ForceTextColor"		"168 168 168 255"
		"EnableMouseInput"		"0"		
	}

	"PlayedMap_Img"			
	{
		"ControlName"		"ImagePanel"
		"fieldName"			"PlayedMap_Img"
		"xpos"				"22"
		"ypos"				"116"
		"wide"				"240"
		"tall"				"102"
		"zpos"				"2"
		"visible"			"1"
		"image"				"voxel/OutUI/default_img_01"
		"scaleImage"		"1"
	}
	
	"PlayedMap_ScriptIcon"
	{
		"ControlName"		"ImagePanel"
		"filedName"			"PlayedMap_ScriptIcon"
		"xpos"				"26"
		"ypos"				"199"
		"wide"				"31"
		"tall"				"15"
		"zpos"				"3"
		"visible"			"0"
		"image"				"voxel/OutUI/lua_icon"
		"scaleImage"		"0"
	}

	"PlayedMap_BGImg"			
	{
		"ControlName"		"NinePicsPanel"
		"fieldName"			"PlayedMap_BGImg"
		"xpos"				"17"
		"ypos"				"111"
		"wide"				"250"
		"tall"				"112"
		"zpos"				"2"
		"visible"			"1"
		"NinePicsTgaPath"	"resource/zmstate/graph_bg"
		"scaleImage"		"1"
	}

	"PlayedMapInfo_Img"
	{
		"ControlName"	"ImagePanel"
		"fieldName"		"PlayedMapInfo_Img"
		"xpos"			"274"
		"ypos"			"111"
		"wide"			"176"
		"tall"			"112"
		"zpos"			"2"
		"visible"		"1"
		"image"			"voxel/OutUI/Info_bg"
		"scaleImage"	"1"
	}

	"PlayedMapInfo_Play_Label"
	{
		"ControlName"	"Label"
		"fieldName"		"PlayedMapInfo_Play_Label"
		"xpos"			"290"
		"ypos"			"125"
		"wide"			"100"
		"tall"			"12"
		"zpos"			"3"
		"visible"		"1"
		"Font"			"DefaultMiddle"
		"labelText"		"#Vxl_OutUI_ResultBoard_PlayCnt"
	}

	"PlayedMapInfo_Play_Cnt_Label"
	{
		"ControlName"		"Label"
		"fieldName"			"PlayedMapInfo_Play_Cnt_Label"
		"xpos"				"290"
		"ypos"				"125"
		"wide"				"150"
		"tall"				"12"
		"zpos"				"3"
		"visible"			"1"
		"textAlignment"		"east"
		"Font"				"DefaultMiddle"
		"labelText"			"0000"
	}

	"PlayedMapInfo_Cube_Label"
	{
		"ControlName"	"Label"
		"fieldName"		"PlayedMapInfo_Cube_Label"
		"xpos"			"290"
		"ypos"			"140"
		"wide"			"100"
		"tall"			"12"
		"zpos"			"3"
		"visible"		"1"
		"Font"			"DefaultMiddle"
		"labelText"		"#Vxl_OutUI_ResultBoard_CubeCnt"
	}

	"PlayedMapInfo_Cube_Cnt_Label"
	{
		"ControlName"		"Label"
		"fieldName"			"PlayedMapInfo_Cube_Cnt_Label"
		"xpos"				"290"
		"ypos"				"140"
		"wide"				"150"
		"tall"				"12"
		"zpos"				"3"
		"visible"			"1"
		"textAlignment"		"east"
		"Font"				"DefaultMiddle"
		"labelText"			"0000"
	}

	"PlayedMapInfo_Like_Label"
	{
		"ControlName"	"Label"
		"fieldName"		"PlayedMapInfo_Like_Label"
		"xpos"			"290"
		"ypos"			"155"
		"wide"			"100"
		"tall"			"12"
		"zpos"			"3"
		"visible"		"1"
		"Font"			"DefaultMiddle"
		"labelText"		"#Vxl_OutUI_ResultBoard_LikeCnt"
	}

	"PlayedMapInfo_Like_Cnt_Label"
	{
		"ControlName"		"Label"
		"fieldName"			"PlayedMapInfo_Like_Cnt_Label"
		"xpos"				"290"
		"ypos"				"155"
		"wide"				"150"
		"tall"				"12"
		"zpos"				"3"
		"visible"			"1"
		"textAlignment"		"east"
		"Font"				"DefaultMiddle"
		"labelText"			"0000"
	}

	"PlayedMapInfo_Exp_Label"
	{
		"ControlName"	"Label"
		"fieldName"		"PlayedMapInfo_Exp_Label"
		"xpos"			"290"
		"ypos"			"170"
		"wide"			"100"
		"tall"			"12"
		"zpos"			"3"
		"visible"		"1"
		"Font"			"DefaultMiddle"
		"labelText"		"#Vxl_OutUI_ResultBoard_Exp"
	}

	"PlayedMapInfo_Exp_Cnt_Label"
	{
		"ControlName"		"Label"
		"fieldName"			"PlayedMapInfo_Exp_Cnt_Label"
		"xpos"				"290"
		"ypos"				"170"
		"wide"				"150"
		"tall"				"12"
		"zpos"				"3"
		"visible"			"1"
		"textAlignment"		"east"
		"Font"				"DefaultMiddle"
		"labelText"			"0000"
	}

	"PlayedMapInfo_Point_Label"
	{
		"ControlName"	"Label"
		"fieldName"		"PlayedMapInfo_Point_Label"
		"xpos"			"290"
		"ypos"			"185"
		"wide"			"100"
		"tall"			"12"
		"zpos"			"3"
		"visible"		"1"
		"Font"			"DefaultMiddle"
		"labelText"		"#Vxl_OutUI_ResultBoard_Point"
	}

	"PlayedMapInfo_Point_Cnt_Label"
	{
		"ControlName"		"Label"
		"fieldName"			"PlayedMapInfo_Point_Cnt_Label"
		"xpos"				"290"
		"ypos"				"185"
		"wide"				"150"
		"tall"				"12"
		"zpos"				"3"
		"visible"			"1"
		"textAlignment"		"east"
		"Font"				"DefaultMiddle"
		"labelText"			"0000"
	}

	"PlayedMapInfo_PlayTime_Label"
	{
		"ControlName"	"Label"
		"fieldName"		"PlayedMapInfo_PlayTime_Label"
		"xpos"			"290"
		"ypos"			"200"
		"wide"			"100"
		"tall"			"12"
		"zpos"			"3"
		"visible"		"1"
		"Font"			"DefaultMiddle"
		"labelText"		"#Vxl_OutUI_ResultBoard_PlayTime"
	}

	"PlayedMapInfo_PlayTime_Cnt_Label"
	{
		"ControlName"		"Label"
		"fieldName"			"PlayedMapInfo_PlayTime_Cnt_Label"
		"xpos"				"290"
		"ypos"				"200"
		"wide"				"150"
		"tall"				"12"
		"zpos"				"3"
		"visible"			"1"
		"textAlignment"		"east"
		"Font"				"DefaultMiddle"
		"labelText"			"0000"
	}

	"PlayedMapInfo_Memo_Btn"			
	{
		"ControlName"		"Button"
		"fieldName"			"PlayedMapInfo_Memo_Btn"
		"xpos"				"334"
		"ypos"				"77"
		"wide"				"121"
		"tall"				"35"
		"zpos"				"2"
		"labelText"			"#Vxl_OutUI_ResultBoard_Memo"
		"textAlignment"		"center"
		"Command"			"RB_Memo"
	}

	"PlayedMapInfo_Report_Btn"			
	{
		"ControlName"		"Button"
		"fieldName"			"PlayedMapInfo_Report_Btn"
		"xpos"				"29"
		"ypos"				"77"
		"wide"				"110"
		"tall"				"35"
		"zpos"				"2"
		"labelText"			"#Vxl_OutUI_ResultBoard_Report"
		"textAlignment"		"center"
		"Command"			"RB_Report"
	}

	"PlayedMapInfo_Recommend_Btn"			
	{
		"ControlName"			"Button"
		"fieldName"				"PlayedMapInfo_Recommend_Btn"
		"xpos"					"29"
		"ypos"					"237"
		"wide"					"124"
		"tall"					"35"
		"zpos"					"2"
		"labelText"				"#Vxl_OutUI_ResultBoard_Recommend"
		"textAlignment"			"center"
		"EnableForceTextColor"	"1"
		"ForceTextColor"		"255 146 146 255"
		"Command"				"RB_Recommend"
	}
	
	"PlayedMapInfo_Regame"			
	{
		"ControlName"			"Button"
		"fieldName"				"PlayedMapInfo_Regame_Btn"
		"xpos"					"217"
		"ypos"					"237"
		"wide"					"124"
		"tall"					"35"
		"zpos"					"2"
		"labelText"				"#Vxl_OutUI_ResultBoard_Recommend"
		"textAlignment"			"center"
		"EnableForceTextColor"	"1"
		"Command"				"RB_Regame"
	}

	"PlayedMapInfo_OK_Btn"				
	{
		"ControlName"		"Button"
		"fieldName"			"PlayedMapInfo_OK_Btn"
		"xpos"				"342"
		"ypos"				"237"
		"wide"				"97"
		"tall"				"35"
		"zpos"				"2"
		"labelText"			"#Vxl_OutUI_ResultBoard_OK"
		"textAlignment"		"center"
		"Command"			"RB_Ok"
	}
}

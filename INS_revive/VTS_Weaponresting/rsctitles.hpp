	class VTS_weaponresting_Loaded
	{
		idd = -1;
		movingEnable = 0;
		enableSimulation = 1;
		enableDisplay = 1;
		duration = 2147483647;
		fadein = 0;
		fadeout = 0;
		onLoad = "uiNamespace setVariable [""VTS_WeaponResting_loaded"", _this select 0]";
	};
	class VTS_WeaponResting_Dialog 
	{
		idd = -1;
		movingEnable = 0;
		enableSimulation = 1;
		enableDisplay = 1;
		duration = 2147483647;
		fadein = 0;
		fadeout = 0;
		onLoad = "uiNamespace setVariable [""VTS_WeaponResting_Dialog_id"", _this select 0]";
		class RscPicture;
		class RscText;
		class controls 
		{ 
			class VTS_WeaponResting_Dialog_Picture: RscPicture
			{
			idc = 0;
			type = 0;
			style = 48;
			text = "INS_revive\vts_weaponresting\vts_weaponresting.paa";
			x = 0.0115015 * safezoneW + safezoneX;
			y = 0.709983 * safezoneH + safezoneY;
			w = 0.0829102 * safezoneW;
			h = 0.0699966 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0, 0, 0, 0.3};
			font = "TahomaB";
			sizeEx = 0;
			lineSpacing = 0;
			fixedWidth = 0;
			shadow = 0;
			};
			class VTS_WeaponResting_Dialog_Text: RscText
			{
			idc = 1;
			type = 13;
			style = 0x02;
			text = "";
			colorBackground[] = {0,0,0,0.0};
			colorText[] = {1.0,1.0,1.0,0.75};
			colorDisabled[] = {0.6,0.1,0.3,0};
			colorBackgroundDisabled[] = {0,0.0,0};
			colorBackgroundActive[] = {0.0,0.0,1.0,0.0};
			colorFocused[] = {0,0,0,0.0};
			colorShadow[] = {0,0,0,0.0};
			colorBorder[] = {0,0,0,0};	
			font="TahomaB";//
			SizeEx = 0.040000;
			Size = 0.025 * safezoneH;
			LineSpacing = 1.000000;
			shadow = 2;
			fixedWidth = 0;
			x = 0.0115015 * safezoneW + safezoneX;
			y = 0.749983 * safezoneH + safezoneY;
			w = 0.0829102 * safezoneW;
			h = 0.0699966 * safezoneH;
			offsetX = 0.000;
			offsetY = 0.000;
			offsetPressedX = 0.000;
			offsetPressedY = 0.000;
			borderSize = 0;	
			soundEnter[] = {};
			soundPush[] = {};
			soundClick[] = {};
			soundEscape[] = {};	
			};	
		};
	};	
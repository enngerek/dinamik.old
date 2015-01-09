
#define VTS_weaponresting_sway_up 0.125
#define VTS_weaponresting_sway_middle 0.1
#define VTS_weaponresting_sway_down 0.075

class CfgMovesBasic
{
	class Actions
	{
		class RifleStandActions;
		class vts_wr_standup_rest: RifleStandActions {stop = "aadjpercmstpsraswrfldup_rest"; turnL = "aadjpercmstpsraswrfldup_rest";turnR = "aadjpercmstpsraswrfldup_rest";};
		class vts_wr_stand_rest: RifleStandActions{	stop = "amovpercmstpsraswrfldnon_rest"; turnL = "amovpercmstpsraswrfldnon_rest";turnR = "amovpercmstpsraswrfldnon_rest";};
		class vts_wr_standright_rest: RifleStandActions{ stop = "aadjpercmstpsraswrfldright_rest"; turnL = "aadjpercmstpsraswrfldright_rest";turnR = "aadjpercmstpsraswrfldright_rest";};
		class vts_wr_standleft_rest: RifleStandActions{	stop = "aadjpercmstpsraswrfldleft_rest"; turnL = "aadjpercmstpsraswrfldleft_rest";turnR = "aadjpercmstpsraswrfldleft_rest";};
		class vts_wr_standdown_rest: RifleStandActions{	stop = "aadjpercmstpsraswrflddown_rest"; turnL = "aadjpercmstpsraswrflddown_rest";turnR = "aadjpercmstpsraswrflddown_rest";};
		
		class RifleKneelActions;
		class vts_wr_middleup_rest: RifleKneelActions {stop = "aadjpknlmstpsraswrfldup_rest"; turnL = "aadjpknlmstpsraswrfldup_rest";turnR = "aadjpknlmstpsraswrfldup_rest";};
		class vts_wr_middle_rest: RifleKneelActions{	stop = "amovpknlmstpsraswrfldnon_rest"; turnL = "amovpknlmstpsraswrfldnon_rest";turnR = "amovpknlmstpsraswrfldnon_rest";};
		class vts_wr_middleright_rest: RifleKneelActions{ stop = "aadjpknlmstpsraswrfldright"; turnL = "aadjpknlmstpsraswrfldright";turnR = "aadjpknlmstpsraswrfldright";};
		class vts_wr_middleleft_rest: RifleKneelActions{	stop = "aadjpknlmstpsraswrfldleft"; turnL = "aadjpknlmstpsraswrfldleft";turnR = "aadjpknlmstpsraswrfldleft";};
		class vts_wr_middledown_rest: RifleKneelActions{	stop = "aadjpknlmstpsraswrflddown_rest"; turnL = "aadjpknlmstpsraswrflddown_rest";turnR = "aadjpknlmstpsraswrflddown_rest";};
			
		class RifleProneActions;
		class vts_wr_lowup_rest: RifleProneActions {stop = "aadjppnemstpsraswrfldup_rest"; turnL = "aadjppnemstpsraswrfldup_rest";turnR = "aadjppnemstpsraswrfldup_rest";};
		class vts_wr_low_rest: RifleProneActions{	stop = "amovppnemstpsraswrfldnon_rest"; turnL = "amovppnemstpsraswrfldnon_rest";turnR = "amovppnemstpsraswrfldnon_rest";};
		class vts_wr_lowright_rest: RifleProneActions{ stop = "aadjppnemstpsraswrfldright_rest"; turnL = "aadjppnemstpsraswrfldright_rest";turnR = "aadjppnemstpsraswrfldright_rest";};
		class vts_wr_lowleft_rest: RifleProneActions{	stop = "aadjppnemstpsraswrfldleft_rest"; turnL = "aadjppnemstpsraswrfldleft_rest";turnR = "aadjppnemstpsraswrfldleft_rest";};
		class vts_wr_lowdown_rest: RifleProneActions{	stop = "aadjppnemstpsraswrflddown_rest"; turnL = "aadjppnemstpsraswrflddown_rest";turnR = "aadjppnemstpsraswrflddown_rest";};
	};
};
class CfgMovesMaleSdr : CfgMovesBasic
{
	class States
	{
		class aadjpercmstpsraswrfldup;
		class aadjpercmstpsraswrfldup_rest:aadjpercmstpsraswrfldup {aimPrecision = VTS_weaponresting_sway_up;actions = "vts_wr_standup_rest";};
		class amovpercmstpsraswrfldnon;
		class amovpercmstpsraswrfldnon_rest:amovpercmstpsraswrfldnon {aimPrecision = VTS_weaponresting_sway_up;actions = "vts_wr_stand_rest";};
		class aadjpercmstpsraswrfldright;
		class aadjpercmstpsraswrfldright_rest:aadjpercmstpsraswrfldright {aimPrecision = VTS_weaponresting_sway_up;actions = "vts_wr_standright_rest";};	 
		class aadjpercmstpsraswrfldleft;
		class aadjpercmstpsraswrfldleft_rest:aadjpercmstpsraswrfldleft {aimPrecision = VTS_weaponresting_sway_up;actions = "vts_wr_standleft_rest";};
		class aadjpercmstpsraswrflddown;
		class aadjpercmstpsraswrflddown_rest:aadjpercmstpsraswrflddown {aimPrecision = VTS_weaponresting_sway_up;actions = "vts_wr_standdown_rest";};
		
		class aadjpknlmstpsraswrfldup;
		class aadjpknlmstpsraswrfldup_rest:aadjpknlmstpsraswrfldup {aimPrecision = VTS_weaponresting_sway_middle;actions = "vts_wr_middleup_rest";};
		class amovpknlmstpsraswrfldnon;
		class amovpknlmstpsraswrfldnon_rest:amovpknlmstpsraswrfldnon {aimPrecision = VTS_weaponresting_sway_middle;actions = "vts_wr_middle_rest";};
		class aadjpknlmstpsraswrfldright;
		class aadjpknlmstpsraswrfldright_rest:aadjpknlmstpsraswrfldright {aimPrecision = VTS_weaponresting_sway_middle;actions = "vts_wr_middleright_rest";};
		class aadjpknlmstpsraswrfldleft;
		class aadjpknlmstpsraswrfldleft_rest:aadjpknlmstpsraswrfldleft {aimPrecision = VTS_weaponresting_sway_middle;actions = "vts_wr_middleleft_rest";};
		class aadjpknlmstpsraswrflddown;
		class aadjpknlmstpsraswrflddown_rest:aadjpknlmstpsraswrflddown {aimPrecision = VTS_weaponresting_sway_middle;actions = "vts_wr_middledown_rest";};
			
		class aadjppnemstpsraswrfldup;
		class aadjppnemstpsraswrfldup_rest:aadjppnemstpsraswrfldup {aimPrecision = VTS_weaponresting_sway_down;actions = "vts_wr_lowup_rest";};
		class amovppnemstpsraswrfldnon;
		class amovppnemstpsraswrfldnon_rest:amovppnemstpsraswrfldnon {aimPrecision = VTS_weaponresting_sway_down;actions = "vts_wr_low_rest";};
		class aadjppnemstpsraswrfldright;
		class aadjppnemstpsraswrfldright_rest:aadjppnemstpsraswrfldright {aimPrecision = VTS_weaponresting_sway_down;actions = "vts_wr_lowright_rest";};
		class aadjppnemstpsraswrfldleft;
		class aadjppnemstpsraswrfldleft_rest:aadjppnemstpsraswrfldleft {aimPrecision = VTS_weaponresting_sway_down;actions = "vts_wr_lowleft_rest";};
		class aadjppnemstpsraswrflddown;
		class aadjppnemstpsraswrflddown_rest:aadjppnemstpsraswrflddown {aimPrecision = VTS_weaponresting_sway_down;actions = "vts_wr_lowdown_rest";};		
	};
};
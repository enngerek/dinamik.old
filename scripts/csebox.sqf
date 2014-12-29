//////////////////////////
// CSE CRATE BY M4RT14L //
//////////////////////////

if (! isServer) exitWith {};

_crate = _this select 0;

while {alive _crate} do
{

clearMagazineCargoGlobal _crate;
clearItemCargoGlobal _crate;

///AGM MAGAZINES///

_crate addMagazineCargoGlobal ["AGM_30Rnd_65x39_caseless_mag_Tracer_Dim", 200];
_crate addMagazineCargoGlobal ["AGM_30Rnd_65x39_caseless_mag_SD", 200];
_crate addMagazineCargoGlobal ["AGM_30Rnd_65x39_caseless_mag_AP", 200];
_crate addMagazineCargoGlobal ["AGM_30Rnd_65x39_caseless_green_mag_Tracer_Dim", 200];
_crate addMagazineCargoGlobal ["AGM_30Rnd_65x39_caseless_green_mag_SD", 200];
_crate addMagazineCargoGlobal ["AGM_30Rnd_65x39_caseless_green_mag_AP", 200];
_crate addMagazineCargoGlobal ["AGM_30Rnd_556x45_Stanag_Tracer_Dim", 200];
_crate addMagazineCargoGlobal ["AGM_30Rnd_556x45_Stanag_SD", 200];
_crate addMagazineCargoGlobal ["AGM_30Rnd_556x45_Stanag_AP", 200];
_crate addMagazineCargoGlobal ["AGM_20Rnd_762x51_Mag_Tracer", 200];
_crate addMagazineCargoGlobal ["AGM_20Rnd_762x51_Mag_Tracer_Dim", 200];
_crate addMagazineCargoGlobal ["AGM_20Rnd_762x51_Mag_SD", 200];
_crate addMagazineCargoGlobal ["AGM_20Rnd_762x51_Mag_AP", 200];
_crate addMagazineCargoGlobal ["AGM_HandFlare_Green", 200];
_crate addMagazineCargoGlobal ["AGM_HandFlare_Red", 200];
_crate addMagazineCargoGlobal ["AGM_HandFlare_White", 200];
_crate addMagazineCargoGlobal ["AGM_HandFlare_Yellow", 200];
_crate addMagazineCargoGlobal ["AGM_M84", 200];

///AGM, ALiVE & ctab ITEMS///

_crate addItemCargoGlobal ["AGM_muzzle_mzls_H", 40];
_crate addItemCargoGlobal ["AGM_muzzle_mzls_B", 40];
_crate addItemCargoGlobal ["AGM_muzzle_mzls_L", 40];
_crate addItemCargoGlobal ["AGM_muzzle_mzls_smg_01", 40];
_crate addItemCargoGlobal ["AGM_muzzle_mzls_smg_02", 40];
_crate addItemCargoGlobal ["AGM_Clacker", 40];
_crate addItemCargoGlobal ["AGM_DefusalKit", 40];
_crate addItemCargoGlobal ["AGM_M26_Clacker", 40];
_crate addItemCargoGlobal ["AGM_EarBuds", 40];
_crate addItemCargoGlobal ["AGM_CableTie", 40];
_crate addItemCargoGlobal ["AGM_UAVBattery", 40];
_crate addItemCargoGlobal ["AGM_MapTools", 40];
_crate addItemCargoGlobal ["AGM_SpareBarrel", 40];
_crate addItemCargoGlobal ["AGM_Vector", 40];
_crate addItemCargoGlobal ["AGM_ItemKestrel", 40];
_crate addItemCargoGlobal ["ItemcTab", 40];
_crate addItemCargoGlobal ["ItemAndroid", 40];
_crate addItemCargoGlobal ["ItemcTabHCam", 40];
_crate addItemCargoGlobal ["AGM_Bloodbag", 200];
_crate addItemCargoGlobal ["AGM_Epipen", 200];
_crate addItemCargoGlobal ["AGM_Morphine", 200];
_crate addItemCargoGlobal ["AGM_Bandage", 200];
_crate addItemCargoGlobal ["ALiVE_Tablet", 40];

sleep 600;
};   
 

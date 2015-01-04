fnc_deleteOldAOUnits = {
    {
        if (typeName _x == "GROUP") then {
            {
                if (vehicle _x != _x) then {
                    deleteVehicle (vehicle _x);
                };
                deleteVehicle _x;
            } forEach (units _x);
        } else {
if (vehicle _x != _x) then {
                deleteVehicle (vehicle _x);
            };
            if !(_x isKindOf "Man") then {
                {
                    deleteVehicle _x;
                } forEach (crew _x)
};
            deleteVehicle _x;
        };
    } forEach _this;
};

/*
Sorry, I changed the parameters without mentioning it. The array of units and groups should not be in an array. The correct usage of the function is like so:

0 = _unitsArray spawn fnc_deleteOldUnits;


_vehicles = nearestObjects [_location, ["car","air","armored","ship","submarine","support"], 1000];
{
if (count crew vehicle _x == 0) then {deleteVehicle _x};
} forEach _vehicles
*/
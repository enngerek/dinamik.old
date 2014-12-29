_repeatTasks=false;

if (count TaskArray > 0) 
	then {
	
_randomN=floor (random count TaskArray);
_randomScript=TaskArray select _randomN;

	null = [] execVM _randomScript;
	
	if (!_repeatTasks) 
				then {
				
	TaskArray = TaskArray - [_randomScript];
					
					};
	}else{	
		
 Hint "All tasks Complete";
			
		};
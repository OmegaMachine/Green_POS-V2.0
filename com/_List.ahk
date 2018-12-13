_ListAddStart(ListX,Data,Delim:="|"){
	if(ListX){
	ListX:=Data . Delim . ListX
	}else{
		ListX:=Data
	}
	return ListX
}
_ListAddEnd(ListX,Data,Delim:="|"){
	if(ListX){
	ListX:=ListX . Delim . Data
	}else{
		ListX:=Data
	}
	return ListX
}
_ListRemoveByPos(ListX,PosX,Delim:="|"){
	
	if(PosX>=1){
		if(_ListLength(ListX)>=%PosX%){
			Loop,Parse,ListX,%Delim%
			{

				
				if(A_Index!=PosX){
					
					if(ListZ){
						ListZ:=ListZ . Delim . A_LoopField
					}else{
						ListZ:=A_LoopField
					}
					
				}
			
			}
		}else{
			return ListX
	}
	}else{
		return ListX
}
	
return ListZ
}
_ListRemoveByData(ListX,DataX,Delim:="|"){
Loop,Parse,ListX,%Delim%
			{

				
				if(A_LoopField!=DataX){
					
					if(ListZ){
						ListZ:=ListZ . Delim . A_LoopField
					}else{
						ListZ:=A_LoopField
					}
					
				}
			
			}
			
				return ListZ
			

}
_ListDataByPos(ListX,PosX,Delim:="|"){
	Loop,Parse,ListX,%Delim%
			{
			if(A_Index=PosX){
				return A_LoopField
			}
			}
	return 0
}
_ListAddDataToPos(ListX,DataX,PosX,Delim:="|"){
Loop,Parse,ListX,%Delim%
			{
				
					if(ListZ){
						if(A_Index=PosX){
						ListZ:=ListZ . Delim . DataX	
						}
						ListZ:=ListZ . Delim . A_LoopField
					}else{
						if(A_Index=PosX){
						ListZ:=DataX
						ListZ:=ListZ . Delim . A_LoopField
						}else{
						ListZ:=A_LoopField
					}
					}

			}
			if(ListZ){
				return ListZ
			}
			return ListX
}
_ListLength(ListX,Delim:="|"){
	LengthX:=0
Loop,Parse,ListX,%Delim%
{
if(A_LoopField){
	LengthX++
}
}
return LengthX
}
_InList(ListX,Item,Delim:="|"){
Loop,Parse,ListX,%Delim%
{
if(A_LoopField=Item){
	return 1
}	
}
return 0
}
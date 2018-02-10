public with sharing class testingGit {
	
	public static Integer testInteger{get;set;}
	
	public Integer getInputValues(Integer a, Integer b){
		Integer returnInteger = 0;
		if(a<0 && b<0)
			returnInteger = 0;
		if(a>0 && b>0)
			returnInteger = a+b;
		return returnInteger;	
	}
    
}
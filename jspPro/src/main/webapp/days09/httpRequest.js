
var httpRequest = null; 

function getXMLHttpRequest(){
	if(window.ActiveXObject){  
		try {
			return new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e) {
			try {
				return new ActivXObject("Microsoft.XMLHTTP");
			} catch (e) {
				return null;
			}

		}
	}else if(window.XMLHttpRequest){
		return new XMLHttpRequest();		 
	}else {
		return null;
	}
}

function sendRequest(url,params,callback,method){ 	 
	httpRequest = getXMLHttpRequest(); // xhr	 	 
	httpRequest.onreadystatechange = callback;  // 질문
	var httpMethod= method?method:'GET';        // 파라미터값 안 넘어오면 초기값 GET	
	if(httpMethod!='GET' && httpMethod!='POST') httpMethod='GET';//GET 아니면 POST인데 이상한 거 들어오면 GET
	var httpParams = (params==null||params=="")?null:params;//안들어오면 NULL로 처리
	var httpUrl = url;
	if(httpMethod=='GET' && httpParams != null){//GET방식이면
		httpUrl= httpUrl +"?"+httpParams;//url에 파라미터 붙여
	}	  
	httpRequest.open(httpMethod,httpUrl,true);  
	httpParams = (httpMethod=='POST'?httpParams:null );//POST라면
	httpRequest.send( httpParams );  //send에 싣어
}
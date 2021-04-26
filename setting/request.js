/**
 *  XMLHttpRequest Module JSON 버전!
 */
function Request( callback, url , params, method){
	this.callback = callback;
	this.url = url;
	this.params = params;
	this.method = method;
	this.httpRequest = null;
};
Request.prototype = {
		getXMLHttpRequest : function(){ //function getXMLHttpRequest(){
			if(window.ActiveXObject ){
				try{
					this.httpRequest  = new ActiveXObject("Msxml2.XMLHTTP");
				}catch( e ) {
					try{
						this.httpRequest  = new ActiveXObject("Microsoft.XMLHTTP");
					}catch( ee ) {
						this.httpRequest  = null;
					}//catch(ee)
				}//catch(e)
			}//if(window ActiveXObject)
			else{
				try{
					this.httpRequest = new XMLHttpRequest();
				}catch(e){
					this.httpRequest  = null;
				}
			}
		},//getXMLHttpReqeust : function()
		sendRequest : function(){  // function sendRequest( callback, url,  params, method){
			this.getXMLHttpRequest();
			
			// callback
			this.httpRequest.onreadystatechange = this.callback;
			//method
			var httpMethod = this.method ? this.method : "GET";
			if( httpMethod != "GET" || httpMethod != "POST"){
				httpMethod = "GET";
			}
			
			//Params
			var httpParams  = (this.params=="" || this.params == null) ? "" :  this.params;
			//Url
			var httpUrl = (httpMethod == "GET") ? (this.url + "?" + httpParams) : this.url ;
			
			this.httpRequest.open( httpMethod , httpUrl , true );
			this.httpRequest.setRequestHeader(
					'content-type','application/x-www-form-urlencoded');
			this.httpRequest.send( httpMethod == "POST" ? httpParams : null );
			
		}//sendRequest : function()
};//Request.prototype
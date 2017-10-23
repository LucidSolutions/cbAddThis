component extends="coldbox.system.Interceptor"{

    // DI
    property name="settingService"  inject="id:settingService@cb";
    property name="cbHelper" 		inject="cbHelper@cb";

    /**
    * Configure
    */
    function configure(){}

    /**
     * add to head
     */
	public void function cbui_beforeHeadEnd(event, interceptData) {
		// we don't track preview events
		if(reFindNoCase( "contentbox-ui:.*preview", event.getCurrentEvent() )){
			appendToBuffer( "<!-- No add this social For Preview -->" );	
			return;			
		}
		
		var toBuffer = '';
		
		// settings
		var settingStruct = settingService.getSetting( "cb_addthis_profileid","" );

		// if settings not valid return
		if(isNull(settingStruct) OR settingStruct EQ ""){
			return;
		}
		var profileId = settingStruct;
			
		savecontent variable="toBuffer" {
			writeOutput('<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js##pubid=#profileId#"></script>');
		}
   		appendToBuffer( toBuffer );		
	}

	public void function cbui_postEntryDisplay(event, interceptData) {
		var toBuffer = '';
		var entArticle = event.getValue('entry','',true);
		savecontent variable="toBuffer" {
			writeOutput('<br><div class="addthis_inline_share_toolbox" data-url="#cbHelper.linkEntry( entArticle )#" data-title="#entArticle.getTitle()#"></div>');
		}
   		appendToBuffer( toBuffer );	
	}

	public void function cbui_postPageDisplay(event, interceptData) {
		var toBuffer = '';
		var entArticle = event.getValue('page','',true);
		savecontent variable="toBuffer" {
			writeOutput('<br><div class="addthis_inline_share_toolbox" data-url="#cbHelper.linkPage( entArticle )#" data-title="#entArticle.getTitle()#"></div>');
		}
   		appendToBuffer( toBuffer );	
	}



	
}

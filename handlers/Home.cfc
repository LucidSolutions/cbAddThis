component{

	property name="settingService" 	inject="settingService@contentbox";
	property name="CBHelper"		inject="id:CBHelper@contentbox";

	function index(event,rc,prc){
		prc.xehSave = CBHelper.buildModuleLink( "cbAddThis", "home.saveSettings" );
		event.paramValue( "profileId", "");
		var args 	= { name="cb_addthis_profileid" };
		var allsettings = settingService.findWhere( criteria=args );
		if( NOT isNull( allsettings ) ){
			event.setValue("profileId",allsettings.getValue());
		}	
		event.setView( "home/index" );
	}


	function saveSettings( event, rc, prc ){

		// Save settings
		var findArgs 	= { name="cb_addthis_profileid" };
		var setting = settingService.findWhere( criteria=findArgs );
		if( isNull( setting ) ){
			setting = settingService.new( properties=findArgs );
		}
		setting.setValue(trim(rc.profileId));
		settingService.save( setting );
				
		// Messagebox
		getInstance( "messagebox@cbMessagebox" ).info( "Settings Saved & Updated!" );
		// Relocate via CB Helper
		CBHelper.setNextModuleEvent( "cbAddThis", "home.index" );
	}
}
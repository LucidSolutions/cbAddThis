/**
* ContentBox - A Modular Content Platform
* Copyright since 2012 by Ortus Solutions, Corp
* www.ortussolutions.com/products/contentbox
* ---
*/
component {

	// Module Properties
	this.title 				= "Add This Social Module";
	this.author 			= "Lucid OutSourcing Solutions";
	this.webURL 			= "https://lucidoutsourcing.com/";
	this.description 		= "Add This Social Module for ContentBox";
	this.version			= "2.0";
	// If true, looks for views in the parent first, if not found, then in the module. Else vice-versa
	this.viewParentLookup 	= true;
	// If true, looks for layouts in the parent first, if not found, then in module. Else vice-versa
	this.layoutParentLookup = true;
	// Module Entry Point
	this.entryPoint			= "cbAddThis";
	// Model Namespace
	this.modelNamespace		= "cbAddThis";
	// CF Mapping
	this.cfmapping			= "cbAddThis";
	// Auto-map models
	this.autoMapModels		= true;
	// Module Dependencies
	this.dependencies 		= [];

	function configure(){

		// parent settings
		parentSettings = {

		};

		// module settings - stored in modules.name.settings
		settings = {

		};

		// Layout Settings
		layoutSettings = {
			defaultLayout = ""
		};

		// datasources
		datasources = {

		};

		// web services
		webservices = {

		};

		// SES Routes
		routes = [
			// Module Entry Point
			{pattern="/", handler="home",action="index"},
			// Convention Route
			{pattern="/:handler/:action?"}
		];

		// Custom Declared Points
		interceptorSettings = {
			customInterceptionPoints = ""
		};

		// Custom Declared Interceptors
		interceptors = [
			{ class="#moduleMapping#.interceptors.AddThisSocial", properties={ entryPoint="cbadmin" }, name="AddThisSocial@contentboxAddThis" }
		];

		// Binder Mappings
		// binder.map( "Alias" ).to( "#moduleMapping#.model.MyService" );

	}

	/**
	* Fired when the module is registered and activated.
	*/
	function onLoad(){
		// Let's add ourselves to the main menu in the Modules section
		var menuService = controller.getWireBox().getInstance( "AdminMenuService@contentbox" );
		// Add Menu Contribution
		menuService.addSubMenu(topMenu=menuService.MODULES,name="cbAddThis",label="Add This Social",href="#menuService.buildModuleLink('cbAddThis','home')#" );
	}

	/**
	* Fired when the module is activated by ContentBox
	*/
	function onActivate(){

	}

	/**
	* Fired when the module is unregistered and unloaded
	*/
	function onUnload(){
		// Let's remove ourselves to the main menu in the Modules section
		var menuService = controller.getWireBox().getInstance( "AdminMenuService@contentbox" );
		// Remove Menu Contribution
		menuService.removeSubMenu(topMenu=menuService.MODULES,name="cbAddThis" );
	}

	/**
	* Fired when the module is deactivated by ContentBox
	*/
	function onDeactivate(){

	}

}
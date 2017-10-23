<cfoutput>
	<div class="row">
    <div class="col-md-12">
        <h1 class="h1"><i class="fa fa-flask fa-lg"></i> Add This Social Plugins</h1>
    </div>
</div>

#html.startForm(
    name="commentSettingsForm", 
    action=prc.xehSave, 
    class="form-vertical"
)#	
<div class="row">
	<div class="col-md-12">

		<div class="panel panel-default">
		    <div class="panel-body">
				<div class="form-group">
		            #html.textField(
		                name="profileId",
		                label="AddThis profile ID",
		                value=rc.profileId,
		                class="form-control",
		                size="60",
		                wrapper="div class=controls",
		                labelClass="control-label",
		                groupWrapper="div class=form-group"
		           	)#
				</div>
										
	            <div class="form-actions">
	                #html.button(type="submit", value="Save Settings", class="btn btn-danger" )#
	            </div>  
 	         	
			</div>
		</div>

	</div>
</div>
#html.endForm()#        
</cfoutput>


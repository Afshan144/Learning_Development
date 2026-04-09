sap.ui.define([
	"sap/ui/core/mvc/Controller"
], function (
	Controller
) {
	"use strict";

	return Controller.extend("learningdev.project1.controller.CustomerMasterCreate", {
		onInit() {

		},
		OnPressGoHome() {
			let oRouter = sap.ui.core.UIComponent.getRouterFor(this)
			oRouter.navTo('RouteView1')

			//  var oRouter = sap.ui.core.UIComponent.getRouterFor(this);
            // oRouter.navTo("CustomerMasterCreate");
		}
	});

});
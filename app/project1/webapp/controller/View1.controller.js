sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/ui/model/odata/v2/ODataModel",
], (Controller, ODataModel) => {
    "use strict";

    return Controller.extend("learningdev.project1.controller.View1", {
        onInit: function () {
            
        },

		OnPressCustomer: function(oEvent) {
            var oRouter = sap.ui.core.UIComponent.getRouterFor(this);
            oRouter.navTo("CustomerMasterCreate");
		},
        OnPressSalesOrder: function(oEvent) {
           var oRouter = sap.ui.core.UIComponent.getRouterFor(this);
            oRouter.navTo("SaleOrderCreate");
		},
        OnPressProduct: function(oEvent) {
           var oRouter = sap.ui.core.UIComponent.getRouterFor(this);
            oRouter.navTo("ProductCreate");
		},
         OnPressGridList: function(oEvent) {
           var oRouter = sap.ui.core.UIComponent.getRouterFor(this);
            oRouter.navTo("EmployeeGridList");
		},
    });
});
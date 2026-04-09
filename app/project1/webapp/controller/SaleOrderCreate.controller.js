sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/ui/model/odata/v2/ODataModel",
], (Controller, ODataModel) => {
    "use strict";

    return Controller.extend("learningdev.project1.controller.SaleOrderCreate", {
        onInit: function () {
            // this.CallApi();
        },

        CallApi: function () {
            var oModel = this.getOwnerComponent().getModel();

            console.log("Model:", oModel);

            var oBinding = oModel.bindList("/CustomerMaster");

            oBinding.requestContexts().then(function (aContexts) {

                var aData = aContexts.map(function (oContext) {
                    return oContext.getObject();
                });

                console.log("Data:", aData);

            }).catch(function (oError) {
                console.error("Error:", oError);
            });
        },
        SecondCallApi: function () {
            var oModel = this.getOwnerComponent().getModel('txnModel');

            console.log("Model:", oModel);

            var oBinding = oModel.bindList("/Orders");

            oBinding.requestContexts().then(function (aContexts) {

                var aData = aContexts.map(function (oContext) {
                    return oContext.getObject();
                });

                console.log("Data:", aData);

            }).catch(function (oError) {
                console.error("Error:", oError);
            });
        }
    });
});
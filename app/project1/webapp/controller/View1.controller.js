sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/ui/model/odata/v2/ODataModel",
], (Controller, ODataModel) => {
    "use strict";

    return Controller.extend("learningdev.project1.controller.View1", {
        onInit() {
            // var oModel = new ODataModel("/odata/v2/learningervice/");
            // this.getView().setModel(oModel);
            console.log(this.getView().getModel());
        },
    });
});
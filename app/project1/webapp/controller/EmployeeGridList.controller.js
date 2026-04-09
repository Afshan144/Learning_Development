sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/ui/model/odata/v2/ODataModel",
], (Controller, ODataModel) => {
    "use strict";

    return Controller.extend("learningdev.project1.controller.EmployeeGridList", {
        onInit: function () {

        },
        onSliderMoved: function (oEvent) {
            var fValue = oEvent.getParameter("value");
           
            this.byId("panelForGridList").setWidth(fValue + "%");
        }
    });
});
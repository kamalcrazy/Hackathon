sap.ui.define([
    "sap/m/MessageToast"
], function(MessageToast) {
    'use strict';

    return {
        SetVendor: function(oBindingContext,aSelectedContexts) {       
             aSelectedContexts.forEach(element => {
                MessageToast.show(element.sPath);
                var aData = jQuery.ajax({
                    type: "PATCH",
                    contentType: "application/json",
                    url: "/odata/v4/store-db"+element.sPath,
                    data: JSON.stringify({is_vendor:true})
                }).then(element.requestRefresh());
            });
        },
        GetVendor: async function(oBindingContext,aSelectedContexts) { 

            if(aSelectedContexts.length > 1){
                return false;
            }
            var aData = await jQuery.ajax({
                type: "GET",
                contentType: "application/json",
                url: "/odata/v4/store-db"+aSelectedContexts[0].sPath,
            })
            return !aData.is_vendor;

        }, 
        SetCustomer: function(oBindingContext,aSelectedContexts) {       
            aSelectedContexts.forEach(element => {
               MessageToast.show(element.sPath);
               var aData = jQuery.ajax({
                   type: "PATCH",
                   contentType: "application/json",
                   url: "/odata/v4/store-db"+element.sPath,
                   data: JSON.stringify({is_customer:true})
               }).then(element.requestRefresh());
           });
       }, 
       GetCustomer: async function(oBindingContext,aSelectedContexts) { 

        if(aSelectedContexts.length > 1){
            return false;
        }
        var aData = await jQuery.ajax({
            type: "GET",
            contentType: "application/json",
            url: "/odata/v4/store-db"+aSelectedContexts[0].sPath,
        })
        return !aData.is_customer;

    }, 
    }
});

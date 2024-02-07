const cds=require('@sap/cds')

module.exports = cds.service.impl(function () {

    const { BusinessPartner } = this.entities();

      

    this.before(['CREATE'], BusinessPartner, async(req) => {
       
        let query1 = SELECT.from(BusinessPartner).where({ref:["bp_number"]}, "=", {val: req.data.bp_number});
        result = await cds.run(query1);
        if (result.length >0) {
            req.error({'code': 'EXISTS',message:' already exists'});
        }

    });
        
}  
);
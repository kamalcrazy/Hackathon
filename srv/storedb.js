const cds=require('@sap/cds')
module.exports = cds.service.impl(async function () {
    const { BusinessPartner } = this.entities;
    this.on("READ", BusinessPartner, async (req) => {
        const results = await cds.run(req.query);
        return results;
      });
    this.before("CREATE",  BusinessPartner, async (req) => {
        const { bp_number} = req.data;

    
        const query1 = SELECT.from( BusinessPartner).where({ bp_number: req.data.bp_number });
        const result = await cds.run(query1); 
        if (result.length > 0) {
          req.error({
            code: "BPEXISTS",
            message: " already exists",
            target: "bp_number",
          });
        }
        
      });

})
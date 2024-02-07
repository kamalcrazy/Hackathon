using { com.kamal.storedb as db } from '../db/schema';
service StoreDB {
    entity BuisinessPartner as projection on db.BuisinessPartner;
    entity States as projection on db.States{
        @UI.Hidden: true
        ID,
        *
    };
   
}
annotate StoreDB.BuisinessPartner with @odata.draft.enabled;
annotate StoreDB.States with @odata.draft.enabled;
annotate StoreDB.BuisinessPartner  with {
    name      @assert.format: '^[a-zA-Z]{2,}$';
    pincode @assert.format: '^[1-9][0-9]{5}$';
    //telephone @assert.format: '^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$';
}

annotate StoreDB.BuisinessPartner with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Value : bp_number
        },
        
        {
            $Type : 'UI.DataField',
            Value : name
        },
        {
            $Type : 'UI.DataField',
            Value : address_1
        },
        {
            $Type : 'UI.DataField',
            Value : address_2
        },
          
              {
            $Type : 'UI.DataField',
            Value : city
        },
         {
            Label: 'State',
            Value: state.code
        },  
         {
            $Type : 'UI.DataField',
            Value : is_gstin_number
        },
         {
            $Type : 'UI.DataField',
            Value : is_vendor
        },
         {
            $Type : 'UI.DataField',
            Value : is_customer
        },
           {
            $Type : 'UI.DataField',
            Value : is_gstn_registered
        },


    ],
    UI.SelectionFields: [ name,city],    
    UI.FieldGroup #BuisinessPartnerInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : bp_number,
            },
            {
                $Type : 'UI.DataField',
                Value : name,
            },
            {
                $Type : 'UI.DataField',
                Value : address_1,
            },
            {
                $Type : 'UI.DataField',
                Value : address_2,
            },
            {
                $Type : 'UI.DataField',
                Value : city,
            },
            {
                Label :'State',
                Value :state_ID,
            },
            {
            $Type : 'UI.DataField',
            Value : is_gstin_number,
        },
        {
            $Type : 'UI.DataField',
            Value : is_vendor,
        },
         {
            $Type : 'UI.DataField',
            Value : is_customer,
        },
           {
            $Type : 'UI.DataField',
            Value : is_gstn_registered,
        },

            
          
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'BuisinessPartnerInfoFacet',
            Label : 'BuisinessPartnerInformation',
            Target : '@UI.FieldGroup#BuisinessPartnerInformation',
        },
       /* 
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'StudentLanguagesFacet',
            Label : 'Student Languages Information',
            Target : 'Languages/@UI.LineItem',
        },
      */  
    ],
    
);

annotate StoreDB.States with @(
    UI.LineItem: [
        {
            Value: code
        },
        {
            Value: description
        }
    ],
    UI.FieldGroup #States: {
        $Type: 'UI.FieldGroupType',
        Data: [
            {
                Value: code,
            },
            {
                Value: description,
            }
        ],
    },
    UI.Facets: [
        {
            $Type: 'UI.ReferenceFacet',
            ID: 'StatesFacet',
            Label: 'States',
            Target: '@UI.FieldGroup#States',
        },
    ],

);
annotate StoreDB.BuisinessPartner  with {
     
   state @(
        Common.Text:state.description,
        Common.TextArrangement: #TextOnly,
        Common.ValueListWithFixedValues: true,
        Common.ValueList : {
            Label: 'States',
            CollectionPath : 'States',
            Parameters: [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : state_ID,
                    ValueListProperty : 'ID'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'code'
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'description'
                },
            ]
        }
    )
};


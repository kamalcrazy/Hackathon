using { com.kamal.storedb as db } from '../db/schema';
service StoreDB {
    entity BuisinessPartner as projection on db.BuisinessPartner;
     entity Store as projection on db.Store;
     entity Product as projection on db.Product;
      entity Stock as projection on db.Stock;
    entity States as projection on db.States{
        @UI.Hidden: true
        ID,
        *
    };
   
}
annotate StoreDB.BuisinessPartner with @odata.draft.enabled;
annotate StoreDB.States with @odata.draft.enabled;
annotate StoreDB.Store  with @odata.draft.enabled;
annotate StoreDB.Stock  with @odata.draft.enabled;
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
            Label: 'State',
            Value: pincode
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
            Label: 'State',
            Value: pincode,
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

/*STORE*/




annotate StoreDB.Store with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Value : store_id
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
            Label: 'State',
            Value: pincode
        },   

    ],
    UI.SelectionFields: [ name,city],    
    UI.FieldGroup #StoreInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : store_id,
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
            Label: 'State',
            Value: pincode,
        },  
            
          
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'StoreInfoFacet',
            Label : 'StoreInformation',
            Target : '@UI.FieldGroup#StoreInformation',
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
annotate StoreDB.Store  with {
     
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

/* Product */

annotate StoreDB.Product with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Value : product_id
        },
        
        {
            $Type : 'UI.DataField',
            Value : product_name
        },
        {
            $Type : 'UI.DataField',
            Value : image_url
        },
        {
            $Type : 'UI.DataField',
            Value : cost_price
        },
          
              {
            $Type : 'UI.DataField',
            Value : sell_price
        },
       

    ],
    UI.SelectionFields: [product_name],    
    UI.FieldGroup #ProductInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : product_id,
            },
            {
                $Type : 'UI.DataField',
                Value : product_name,
            },
            {
                $Type : 'UI.DataField',
                Value : image_url,
            },
            {
                $Type : 'UI.DataField',
                Value : cost_price,
            },
            {
                $Type : 'UI.DataField',
                Value : sell_price,
            },
          
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'ProductInfoFacet',
            Label : 'ProductInformation',
            Target : '@UI.FieldGroup#ProductInformation',
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

/* Stock */ 
annotate StoreDB.Stock with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Value : store_id
        },
        
        {
            $Type : 'UI.DataField',
            Value : product_id
        },
        
         {
            Label: 'State',
            Value: stock_qty
        },   

    ],
    UI.SelectionFields: [ name,city],    
    UI.FieldGroup #StoreInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
            $Type : 'UI.DataField',
            Value : store_id,
        },
        
        {
            $Type : 'UI.DataField',
            Value : product_id,
        },
        
         {
            Label: 'State',
            Value: stock_qty,
        },     
          
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'St0ckInfoFacet',
            Label : 'StockInformation',
            Target : '@UI.FieldGroup#StockInformation',
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

annotate StoreDB.Stock.Store with @(
    UI.LineItem:[
        {
            Label: 'StockStore',
            Value: Store.store_ID
        },
       
    ],

     UI.FieldGroup #StockStore : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                Value :store_ID ,
            }
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'StockStoreFacet',
            Label : 'StockStore',
            Target : '@UI.FieldGroup#StockStore',
        },
    ],  
);
annotate StoreDB.Stock.Product with @(
    UI.LineItem:[
        {
            Label: 'StockProduct',
            Value: Product.product_ID
        },
       
    ],

     UI.FieldGroup #StockProduct : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                Value :product_ID ,
            }
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'StockProductFacet',
            Label : 'StockProduct',
            Target : '@UI.FieldGroup#StockProduct',
        },
    ],  
);
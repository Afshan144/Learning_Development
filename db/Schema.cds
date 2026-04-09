namespace LearningDb;

using {
    managed,
    cuid,
    Currency,
    Country
} from '@sap/cds/common';

// entity CustomerMasters : managed {
//     key CustomerGuid : UUID;
//         CustomerCode : String;
//         FirstName    : String;
//         LastName     : String;
//         EmailAddress : String;
//         MobileNo     : String;
// }

// entity Orders : cuid, managed {
//     OrderNo  : String         @title: 'Order Number';
//     Customer : String         @title: 'Customer Name';
//     Total    : Decimal(15, 2) @title: 'Total Amount';
//     Currency : Currency;
//     Items    : Composition of many OrderItems
//                    on Items.parent = $self;
// }

// entity OrderItems : cuid {
//     parent   : Association to Orders;
//     Product  : String         @title: 'Product Name';
//     Quantity : Integer        @title: 'Quantity';
//     Price    : Decimal(15, 2) @title: 'Unit Price';
// }

entity Products : managed {
    key ProductId      : UUID;
        ProductIdTitle : String(100);
        description    :localized String(500);
        stock          : Integer default 0 @mandatory;
        price          : Decimal(15, 2) @mandatory;
        currency       : Currency @mandatory;
        UnitPrice      : Integer64;
        CostPrice      : Integer;
        StockQuantity  : Integer  @mandatory;
        Brand          : String;
        IsActive       : Boolean;
        image          : LargeBinary;
        category       : Association to Categories;
        supplier : Association to Suppliers;
}
entity Categories {
    key CatId          : UUID;
        Catname        : String(50) @mandatory;
        CatDescription : String(255);
        image          : String;
        products       : Association to many Products
                             on products.category = $self;
}
entity Suppliers : cuid, managed {
    @title: 'Supplier Name'
    companyName   : String(100) @assert.unique;    
    @title: 'Contact Person'
    contactPerson : String(50);    
    @title: 'Email Address'
    email         : String(100);    
    @title: 'Phone Number'
    phone         : String(20);    
    @title: 'GST Number'
    gstin         : String(15);     
    @title: 'Street Address'
    address       : String(255);    
    @title: 'City'
    city          : String(50);    
    @title: 'Country'
    country       : Country;     
    @title: 'Payment Terms'
    paymentTerms  : String enum {
        Cash = 'CASH';
        Net30 = 'NET30';
        Net60 = 'NET60';
    };
    products: Association to many Products on products.supplier = $self;
}
entity Customers : cuid, managed {
    @title: 'First Name'
    firstName     : String(50);    
    @title: 'Last Name'
    lastName      : String(50);    
    @title: 'Email Address'
    @assert.format: '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
    email         : String(100);    
    @title: 'Mobile Number'
    phone         : String(20);    
    @title: 'Date of Birth'
    dateOfBirth   : Date;
    @title: 'Gender'
    gender        : String enum { Male = 'M'; Female = 'F'; Other = 'O'; };    
    @title: 'Loyalty Points'
    loyaltyPoints : Integer default 0;
    orders        : Association to many Orders on orders.customer = $self;
}

entity Orders : cuid, managed {
    orderNumber  : String @title: 'Order Number';
    customer     : Association to Customers;
    totalPrice   : Decimal(15, 2);
    status       : String enum { Open = 'O'; Fulfilled = 'F'; Canceled = 'C'; } default 'O';
    Items        : Composition of many OrderItems on Items.parent = $self;
}

entity OrderItems : cuid {
    parent       : Association to Orders; // Link to Main Order
    product      : Association to Products;
    quantity     : Integer;
    netAmount    : Decimal(15, 2);
}
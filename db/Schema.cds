namespace LearningDb;
 using { managed } from '@sap/cds/common';
 
entity CustomerMasters : managed {
    key CustomerGuid:UUID;
    CustomerCode:String;
    FirstName:String;
    LastName:String;
    EmailAddress:String;
    MobileNo:String;
}

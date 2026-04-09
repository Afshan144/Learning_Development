using {LearningDb as db} from '../db/Schema';

service MasterService {
    entity CustomerMaster as projection on db.Customers;
    entity Products as projection on db.Products;
    entity Categories as projection on db.Categories;
    entity Suppliers as projection on db.Suppliers;
    
}

service TransactionService {
    entity Orders as projection on db.Orders;

}

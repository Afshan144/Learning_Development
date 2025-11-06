using {LearningDb as db} from '../db/Schema';

service Learningervice {
    entity CustomerMaster as projection on db.CustomerMasters;

}

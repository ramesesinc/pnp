package com.rameses.gov.police.datamgmt;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.osiris2.common.*

class CaseStatusInfoController extends CRUDController 
{
    String serviceName = 'CaseStatusService'; 
    String entityName  = 'casestatus';  
    String prefixId    = 'CS';
    
    Map createPermission = [domain:'POLICE', role:'DATAMGMT_AUTHOR', permission:'case_status.create']; 
    Map editPermission = [domain:'POLICE', role:'DATAMGMT_AUTHOR', permission:'case_status.edit']; 
    Map deletePermission = [domain:'POLICE', role:'DATAMGMT_AUTHOR', permission:'case_status.delete']; 
    Map approvePermission = [domain:'POLICE', role:'DATAMGMT_AUTHOR', permission:'case_status.approve']; 
    
} 

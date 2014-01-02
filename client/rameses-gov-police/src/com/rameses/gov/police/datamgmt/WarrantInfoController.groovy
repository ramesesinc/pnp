package com.rameses.gov.police.datamgmt;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.osiris2.common.*

class WarrantInfoController extends CRUDController 
{
    String serviceName = 'WarrantService'; 
    String entityName  = 'warrant';  
    String prefixId    = 'W';
    
    boolean allowApprove = false;
    
    Map createPermission = [domain:'POLICE', role:'ENCODER', permission:'warrant.create']; 
    Map editPermission = [domain:'POLICE', role:'ENCODER', permission:'warrant.edit']; 
    Map deletePermission = [domain:'POLICE', role:'ENCODER', permission:'warrant.delete']; 
    Map approvePermission = [domain:'POLICE', role:'ENCODER', permission:'warrant.approve']; 
    
    def statusList = LOV.WARRANT_STATUS;
} 

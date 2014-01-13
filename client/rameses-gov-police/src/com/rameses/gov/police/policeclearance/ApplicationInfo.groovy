package com.rameses.gov.police.policeclearance;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.osiris2.common.*
import com.rameses.osiris2.reports.*;
import java.rmi.server.UID;
import com.rameses.rcp.framework.ClientContext;

class ApplicationInfoController 
{
    @Binding
    def binding;

    @Service("PoliceClearanceService")
    def service;

    @Service("EntityPhysicalService")
    def physicalSvc;

    def entity;
    def entityName = 'policeclearance-info'; 

    String title = "Police Clearance";
    
    void init() {
        def data = service.open([objid: entity.objid]); 
        if (data) {
            entity.clear();
            entity.putAll(data); 
        }
    }

    def verify() {
        def list = service.getWarrants(entity.person);
        return Inv.lookupOpener('person-warrant-info:open', [
            entity:entity, list: list, 
            saveHandler: {o-> 
                    
                def data = service.submitForRelease(entity); 
                if (data) {
                    entity.state = data.state;
                    entity.verifiedbyname = data.verifiedbyname;
                    entity.verifiedbytitle = data.verifiedbytitle;
                    entity.verifiedbydepartment = data.verifiedbydepartment;
                } 
                binding.refresh(); 
            }
        ]); 
    } 
    
    void release() {
        if (!MsgBox.confirm('You are about to release this application. Continue?')) return;
        
        def data = service.release(entity); 
        if (data) {
            entity.state = data.state;
            entity.certifiedbyname = data.certifiedbyname;
            entity.certifiedbytitle = data.certifiedbytitle;
            entity.certifiedbydepartment = data.certifiedbydepartment;
        }         
        
        binding.refresh();
    }     
} 

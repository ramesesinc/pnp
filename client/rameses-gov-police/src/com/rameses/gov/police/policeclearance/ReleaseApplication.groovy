package com.rameses.gov.police.policeclearance;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.osiris2.common.*
import com.rameses.osiris2.reports.*;
import java.rmi.server.UID;
import com.rameses.rcp.framework.ClientContext;

class ReleaseApplicationController 
{
    @Binding
    def binding;
    
    @Service("PoliceClearanceService")
    def polSvc;
    
    @PropertyChangeListener
        def listener = [
            "releaser": {o->
                getCertifiedByInfo( o );
                binding.refresh("entity.certifiedbytitle|entity.certifiedbydepartment");
            }
        ];

    def saveHandler;
    def entity;
    def releaser;
    def releasers;

    void init() {
        releasers = polSvc.getSignatoryList( [doctype:'APPROVER'] );
        releaser = releasers?.find{ it.personnelid == OsirisContext.env.USERID };
        getCertifiedByInfo( releaser );
    }
    
    void getCertifiedByInfo( data ) {
        entity.certifiedby = data?.personnelid;
        entity.certifiedbyname = data?.name;
        entity.certifiedbytitle = data?.title;
        entity.certifiedbydepartment = data?.department;
    }
    
    List getReleaserList() {
        return releasers;
    }
    
    def doOk() {
        getCertifiedByInfo( releaser );
        if (saveHandler) saveHandler(entity);
        
        return '_close';
    }
    
    def doCancel() {
        return '_close';
    }
} 

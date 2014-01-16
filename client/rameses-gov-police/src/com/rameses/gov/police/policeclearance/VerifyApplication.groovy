package com.rameses.gov.police.policeclearance;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.osiris2.common.*
import com.rameses.osiris2.reports.*;
import java.rmi.server.UID;
import com.rameses.rcp.framework.ClientContext;

class VerifyApplicationController 
{
    @Binding
    def binding;
    
    @Service("PoliceClearanceService")
    def polSvc;
    
    @PropertyChangeListener
    def listener = [
        "verifier": {o->
            getVerifiedByInfo( o );
            binding.refresh("entity.verifierbytitle|entity.verifierbydepartment");
        }
    ];

    def saveHandler;
    def entity;
    def list;
    def verifier;
    def verifiers;

    void init() {
        verifiers = polSvc.getSignatoryList( [doctype:'VERIFIER'] );
        verifier = verifiers?.find{ it.personnelid == OsirisContext.env.USERID };
        getVerifiedByInfo( verifier );
    }
    
    void getVerifiedByInfo( data ) {
        entity.verifiedby = data.personnelid;
        entity.verifiedbyname = data.name;
        entity.verifiedbytitle = data.title;
        entity.verifiedbydepartment = data.department;
    }
    
    List getVerifierList() {
        return verifiers;
    }

    def listHandler = [
        fetchList: {
            return list; 
        } 
    ] as BasicListModel 
    
    def doOk() {
        getVerifiedByInfo( verifier );
        if (saveHandler) saveHandler(entity);
        
        return '_close';
    }
    
    def doCancel() {
        return '_close';
    }
} 

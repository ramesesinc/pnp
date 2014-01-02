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

    def saveHandler;
    def entity;
    def list;

    void init() {
        
    }

    def listHandler = [
        fetchList: {
            return list; 
        } 
    ] as BasicListModel 
    
    def doOk() {
        if (saveHandler) saveHandler(entity);
        
        return '_close';
    }
    
    def doCancel() {
        return '_close';
    }
} 

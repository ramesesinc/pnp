package com.rameses.gov.police.policeclearance;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.osiris2.common.*
import com.rameses.osiris2.reports.*;
import java.rmi.server.UID;

class ReceiptAttachmentController 
{
    String title = "Attachment: Receipt";
    def entity = [reftype:'RECEIPT'];
    def saveHandler;
    
    void create() {
    }

    void open() {
        
    } 
    
    def doOk() {
        if (saveHandler) saveHandler(entity);
        
        return '_close';
    }
    
    def doCancel() {
       return '_close'; 
    }

} 

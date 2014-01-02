package com.rameses.gov.police.policeclearance;

import com.rameses.rcp.annotations.*;
import com.rameses.rcp.common.*;
import com.rameses.osiris2.client.*;
import com.rameses.osiris2.common.*
import com.rameses.osiris2.reports.*;
import java.rmi.server.UID;
import com.rameses.rcp.framework.ClientContext;

class PoliceClearanceApplicationController extends PageFlowController 
{
    @Binding
    def binding;

    @Service("PoliceClearanceService")
    def service;

    @Service("EntityService")
    def entitySvc;

    @Service("EntityPhysicalService")
    def physicalSvc;

    String entityName = "policeclearance";
    def entity = [:];

    void init() {
        entity = [objid:"PC"+new UID()];
        hasLookup = false;
    }

    boolean hasLookup;
    def showPersonalInfo() {
        if( !hasLookup && !entity.personalinfoid ) 
            throw new Exception("Please search first before attempting to create a new record");
        String action = "open";
        def data = entity.person;
        if( !data?.objid ) {
            action = "create";
            data = [:];
        }    
        def opener =  InvokerUtil.lookupOpener( 'individualentity:'+action, [entity:data, 
            saveHandler: {o->
                entity.person = o;
                binding.refresh("entity.person.*");
            }
        ]);
        opener.target = "popup";
        return opener;
    }

    def getLookupPersonalInfo() {
        hasLookup = true;
        return InvokerUtil.lookupOpener( 'individualentity:lookup', [
            onselect : { o->
                entity.person = entitySvc.open( o );
                binding.refresh();
            },
            onempty: {
                hasLookup = false;
                entity.person = null;
                binding.refresh('entity.*');
            }
        ]);
    }

    void loadPhysical() {
        if (!entity.person?.objid) 
            throw new Exception("Please select a person first"); 
        
        def p = physicalSvc.open([objid:entity.person.objid]); 
        if (p) entity.person.putAll(p);
    }
    
    void verifyPhysical() {
        if ( !entity.person.photo?.image ) throw new Exception("Profile Photo is required");
        //if ( !entity.person.fingerprint?.leftthumb.image ) throw new Exception("Left thumb mark is required");
        //if ( !entity.person.fingerprint?.rightthumb.image ) throw new Exception("Right thumb mark is required");
    }

    def cameraHandler = [
        onselect : { bytes->
            entity.person.photo = [objid:'PHOTO'+new UID(), changed:true, image: bytes];
            binding.refresh('entity.person.photo.image');
        }
    ] as CameraModel

    def thumbprintHandler = [
        onselect : { info->
            def newdata = [objid:'FINGR'+new UID(), changed:true];
            newdata.leftthumb = [:];
            newdata.leftthumb.image = info.leftThumbData;
            newdata.leftthumb.fmd = info.leftThumbFmdData;
            newdata.rightthumb = [:];
            newdata.rightthumb.image = info.rightThumbData;
            newdata.rightthumb.fmd = info.rightThumbFmdData;
            entity.person.fingerprint = newdata;
            binding.refresh('entity.person.fingerprint.*');
        }
    ] as FingerPrintModel

    def attachOR() {
        def params = [:];
        if (entity.or) {
            params.entity = entity.or;
        } else {
            params.entity = [reftype:'RECEIPT', objid:'ATTC'+new UID()];
        }
        params.saveHandler = {o-> 
            entity.or = o;
            binding.refresh('entity.or.*');
        } 
        return Inv.lookupOpener("orattachment:create", params); 
    }
            
    def attachCTC() {
        def params = [:];
        if (entity.ctc) {
            params.entity = entity.ctc;
        } else {
            params.entity = [reftype:'CTC', objid:'ATTC'+new UID()];
        }
        params.saveHandler = {o-> 
            entity.ctc = o;
            binding.refresh('entity.ctc.*');
        } 
        return Inv.lookupOpener("ctcattachment:create", params); 
    }

    def save() {
        entity = service.submitPoliceClearance(entity);
        return 'forrelease';
    } 
} 

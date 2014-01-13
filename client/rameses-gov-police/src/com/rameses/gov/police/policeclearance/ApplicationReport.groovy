package com.rameses.gov.police.policeclearance;

import com.rameses.rcp.common.*;
import com.rameses.rcp.annotations.*;
import com.rameses.osiris2.client.*;
import com.rameses.osiris2.common.*;
import com.rameses.osiris2.reports.*;

class ApplicationReport extends ReportModel
{
    String title = "Police Clearance";
    def entity;
    def data;    

    void init() {
        buildData(); 
        print();
    }
    
    void buildData() {
        def env = com.rameses.rcp.framework.ClientContext.currentContext.appEnv;        
        def basepath = 'http://'+env['app.host']+'/'+env['app.cluster']+'/json/'+env['app.context'];
        def person = entity.person;        
        if (person.photo) {
            person.photo.imageurl = basepath + '/EntityPhotoService.getPhotoMedia?objid='+person.objid; 
        }        
        if (person.fingerprint?.leftthumb) {
            person.fingerprint.leftthumb.imageurl = basepath + '/EntityPhysicalService.getFingerprintMedia?objid='+person.objid+'&type=left';
        }
        if (person.fingerprint?.rightthumb) {
            person.fingerprint.rightthumb.imageurl = basepath + '/EntityPhysicalService.getFingerprintMedia?objid='+person.objid+'&type=right';
        }        
    }
    
    def close() {
        return '_close';
    }
    
    def back() {
        return '_close';
    }
    
    void print() {
        viewReport();
        ReportUtil.print( this.report, true );
    }

    public Map getParameters() {
        return [:];
    }

    public Object getReportData() {
        return entity;
    }

    public String getReportName() {
        return "com/rameses/gov/police/reports/PoliceClearance.jasper";
    }

    public SubReport[] getSubReports() {
        return null; 
    }
}

package launcher;

import com.rameses.osiris2.test.OsirisTestPlatform;
import java.util.HashMap;
import java.util.Map;
import javax.swing.UIManager;

public class Main 
{
    public static void main(String[] args) throws Exception 
    {
        try { 
            UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName()); 
        } catch(Exception e){;} 
        
        Map env = new HashMap();
        env.put("app.debugMode", "true");         
        env.put("app.cluster", "osiris3");
        env.put("app.context", "epims");
        env.put("app.host", "localhost:8070");
        env.put("readTimeout", "30000"); 
        
        Map profile = new HashMap();
        profile.put("CLIENTTYPE", "desktop");
        profile.put("USERID", "sa");
        profile.put("USER", "sa");
        profile.put("ORGID", "CEB");
        profile.put("ORGNAME", "CEBU CITY");
        
        Map roles = new HashMap();
        roles.put("ADMIN.SYSADMIN", null);
        //roles.put("POLICE.DATAMGMT_AUTHOR", null);
        roles.put("POLICE.ENCODER", null);
        roles.put("POLICE.VERIFIER", null);
        roles.put("POLICE.APPROVER", null);
        OsirisTestPlatform.runTest(env, roles, profile); 
    }    
}

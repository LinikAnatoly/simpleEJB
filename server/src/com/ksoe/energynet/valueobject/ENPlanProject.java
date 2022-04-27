
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENPlanProject;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENPlanWorkRef;
    import  com.ksoe.techcard.valueobject.references.TKProjectWorkRef;
    import  com.ksoe.energypro.valueobject.EPVoltageNominal;

public class ENPlanProject implements Serializable {

    public int  code = Integer.MIN_VALUE;
    public String  numberProject; 
    public String  projectCipher; 
    public String  projectName; 
    public String  userGen; 
    public Date dateEdit;

    public ENPlanWorkRef planRef = new ENPlanWorkRef();
    public TKProjectWorkRef projectWorkRef = new TKProjectWorkRef();
    public EPVoltageNominal voltagenominal = new EPVoltageNominal();

    public static final String tableName = "ENPLANPROJECT";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENPLANPROJECT.CODE";
    public static final String numberProject_Attr = "numberProject";
    public static final String numberProject_Field = "NUMBERPROJECT";
    public static final String numberProject_QFielld = "ENPLANPROJECT.NUMBERPROJECT";
    public static final String projectCipher_Attr = "projectCipher";
    public static final String projectCipher_Field = "PROJECTCIPHER";
    public static final String projectCipher_QFielld = "ENPLANPROJECT.PROJECTCIPHER";
    public static final String projectName_Attr = "projectName";
    public static final String projectName_Field = "PROJECTNAME";
    public static final String projectName_QFielld = "ENPLANPROJECT.PROJECTNAME";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENPLANPROJECT.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENPLANPROJECT.DATEEDIT";

    public static final String planRef_Attr = "planRef";
    public static final String planRef_Field = "PLANREFCODE";
    public static final String  planRef_QFielld = "ENPLANPROJECT.PLANREFCODE";
    public static final String projectWorkRef_Attr = "projectWorkRef";
    public static final String projectWorkRef_Field = "PROJECTWORKREFCODE";
    public static final String  projectWorkRef_QFielld = "ENPLANPROJECT.PROJECTWORKREFCODE";
    public static final String voltagenominal_Attr = "voltagenominal";
    public static final String voltagenominal_Field = "VOLTAGENOMINALCODE";
    public static final String  voltagenominal_QFielld = "ENPLANPROJECT.VOLTAGENOMINALCODE";



    public int getCode(){
       return code;
    }
    
    public void setCode(int code){
       this.code = code;
    }


    public String getNumberProject(){
       return numberProject;
    }
    
    public void setNumberProject(String numberProject){
       this.numberProject = numberProject;
    }


    public String getProjectCipher(){
       return projectCipher;
    }
    
    public void setProjectCipher(String projectCipher){
       this.projectCipher = projectCipher;
    }


    public String getProjectName(){
       return projectName;
    }
    
    public void setProjectName(String projectName){
       this.projectName = projectName;
    }


    public String getUserGen(){
       return userGen;
    }
    
    public void setUserGen(String userGen){
       this.userGen = userGen;
    }


    public Date getDateEdit(){
       return dateEdit;
    }

    public void setDateEdit(Date dateEdit){
       this.dateEdit = dateEdit;
    }

    public ENPlanWorkRef getPlanRef(){
       return planRef;
    }
    
    public void setPlanRef(ENPlanWorkRef planRef){
       this.planRef = planRef;
    }
    public TKProjectWorkRef getProjectWorkRef(){
       return projectWorkRef;
    }
    
    public void setProjectWorkRef(TKProjectWorkRef projectWorkRef){
       this.projectWorkRef = projectWorkRef;
    }
    public EPVoltageNominal getVoltagenominal(){
       return voltagenominal;
    }
    
    public void setVoltagenominal(EPVoltageNominal voltagenominal){
       this.voltagenominal = voltagenominal;
    }

} // end of ENPlanProjectValueObject


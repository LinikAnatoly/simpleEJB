
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENAct2RQFKOrder;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENActRef;
    import  com.ksoe.rqorder.valueobject.references.RQFKOrderRef;
    import  com.ksoe.energynet.valueobject.references.ENAct2RQFKOrderTypeRef;

public class ENAct2RQFKOrder implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public long  modify_time = Long.MIN_VALUE;
    public String  userAdd; 
    public Date dateAdd ;
    public String  userGen; 
    public Date dateEdit ;
    public ENActRef actRef = new ENActRef();
    public RQFKOrderRef fkOrderRef = new RQFKOrderRef();
    public ENAct2RQFKOrderTypeRef typeRef = new ENAct2RQFKOrderTypeRef();
    public static final String tableName = "ENACT2RQFKORDER";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENACT2RQFKORDER.CODE";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENACT2RQFKORDER.MODIFY_TIME";
    public static final String userAdd_Attr = "userAdd";
    public static final String userAdd_Field = "USERADD";
    public static final String userAdd_QFielld = "ENACT2RQFKORDER.USERADD";
    public static final String dateAdd_Attr = "dateAdd";
    public static final String dateAdd_Field = "DATEADD";
    public static final String dateAdd_QFielld = "ENACT2RQFKORDER.DATEADD";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENACT2RQFKORDER.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENACT2RQFKORDER.DATEEDIT";
    public static final String actRef_Attr = "actRef";
    public static final String actRef_Field = "ACTREFCODE";
    public static final String  actRef_QFielld = "ENACT2RQFKORDER.ACTREFCODE";
    public static final String fkOrderRef_Attr = "fkOrderRef";
    public static final String fkOrderRef_Field = "FKORDERREFCODE";
    public static final String  fkOrderRef_QFielld = "ENACT2RQFKORDER.FKORDERREFCODE";
    public static final String typeRef_Attr = "typeRef";
    public static final String typeRef_Field = "TYPEREFCODE";
    public static final String  typeRef_QFielld = "ENACT2RQFKORDER.TYPEREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }

    public void setUserAdd(String aValue){
       userAdd = aValue;
    }

    public String getUserAdd(){
       return userAdd;
    }


    public void setDateAdd(Date aValue){
       dateAdd = aValue;
    }

    public Date getDateAdd(){
       return dateAdd;
    }

    public void setUserGen(String aValue){
       userGen = aValue;
    }

    public String getUserGen(){
       return userGen;
    }


    public void setDateEdit(Date aValue){
       dateEdit = aValue;
    }

    public Date getDateEdit(){
       return dateEdit;
    }

    public void setActRef(ENActRef aValue){
       actRef = aValue;
    }

    public ENActRef getActRef(){
       return actRef;
    }
    public void setFkOrderRef(RQFKOrderRef aValue){
       fkOrderRef = aValue;
    }

    public RQFKOrderRef getFkOrderRef(){
       return fkOrderRef;
    }
    public void setTypeRef(ENAct2RQFKOrderTypeRef aValue){
       typeRef = aValue;
    }

    public ENAct2RQFKOrderTypeRef getTypeRef(){
       return typeRef;
    }

} // end of ENAct2RQFKOrderValueObject



//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENDamageRecovery2ENAct;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENDamageRecoveryRef;
    import  com.ksoe.energynet.valueobject.references.ENActRef;

public class ENDamageRecovery2ENAct implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  userGen; 
    public Date dateEdit ;
    public long  modify_time = Long.MIN_VALUE;
    public ENDamageRecoveryRef damageRecoveryRef = new ENDamageRecoveryRef();
    public ENActRef actRef = new ENActRef();
    public static final String tableName = "ENDAMAGERECOVERY2ENACT";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENDAMAGERECOVERY2ENACT.CODE";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENDAMAGERECOVERY2ENACT.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENDAMAGERECOVERY2ENACT.DATEEDIT";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENDAMAGERECOVERY2ENACT.MODIFY_TIME";
    public static final String damageRecoveryRef_Attr = "damageRecoveryRef";
    public static final String damageRecoveryRef_Field = "DAMAGERECOVERYREFCODE";
    public static final String  damageRecoveryRef_QFielld = "ENDAMAGERECOVERY2ENACT.DAMAGERECOVERYREFCODE";
    public static final String actRef_Attr = "actRef";
    public static final String actRef_Field = "ACTREFCODE";
    public static final String  actRef_QFielld = "ENDAMAGERECOVERY2ENACT.ACTREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
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

    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }

    public void setDamageRecoveryRef(ENDamageRecoveryRef aValue){
       damageRecoveryRef = aValue;
    }

    public ENDamageRecoveryRef getDamageRecoveryRef(){
       return damageRecoveryRef;
    }
    public void setActRef(ENActRef aValue){
       actRef = aValue;
    }

    public ENActRef getActRef(){
       return actRef;
    }

} // end of ENDamageRecovery2ENActValueObject


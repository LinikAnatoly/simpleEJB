
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENIPItem2TKMaterials;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENIPItemRef;
    import  com.ksoe.techcard.valueobject.references.TKMaterialsRef;

public class ENIPItem2TKMaterials implements Serializable {

    public int  code = Integer.MIN_VALUE;
    public String  userAdd; 
    public Date dateAdd;
    public String  userGen; 
    public Date dateEdit;
    public long  modify_time = Long.MIN_VALUE;
    public int  isMaterialForCount = Integer.MIN_VALUE;

    public ENIPItemRef ipItemRef = new ENIPItemRef();
    public TKMaterialsRef materialRef = new TKMaterialsRef();

    public static final String tableName = "ENIPITEM2TKMATERIALS";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENIPITEM2TKMATERIALS.CODE";
    public static final String userAdd_Attr = "userAdd";
    public static final String userAdd_Field = "USERADD";
    public static final String userAdd_QFielld = "ENIPITEM2TKMATERIALS.USERADD";
    public static final String dateAdd_Attr = "dateAdd";
    public static final String dateAdd_Field = "DATEADD";
    public static final String dateAdd_QFielld = "ENIPITEM2TKMATERIALS.DATEADD";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENIPITEM2TKMATERIALS.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENIPITEM2TKMATERIALS.DATEEDIT";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENIPITEM2TKMATERIALS.MODIFY_TIME";
    public static final String isMaterialForCount_Attr = "isMaterialForCount";
    public static final String isMaterialForCount_Field = "ISMATERIALFORCOUNT";
    public static final String isMaterialForCount_QFielld = "ENIPITEM2TKMATERIALS.ISMATERIALFORCOUNT";

    public static final String ipItemRef_Attr = "ipItemRef";
    public static final String ipItemRef_Field = "IPITEMREFCODE";
    public static final String  ipItemRef_QFielld = "ENIPITEM2TKMATERIALS.IPITEMREFCODE";
    public static final String materialRef_Attr = "materialRef";
    public static final String materialRef_Field = "MATERIALREFCODE";
    public static final String  materialRef_QFielld = "ENIPITEM2TKMATERIALS.MATERIALREFCODE";



    public int getCode(){
       return code;
    }
    
    public void setCode(int code){
       this.code = code;
    }


    public String getUserAdd(){
       return userAdd;
    }
    
    public void setUserAdd(String userAdd){
       this.userAdd = userAdd;
    }


    public Date getDateAdd(){
       return dateAdd;
    }

    public void setDateAdd(Date dateAdd){
       this.dateAdd = dateAdd;
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


    public long getModify_time(){
       return modify_time;
    }
    
    public void setModify_time(long modify_time){
       this.modify_time = modify_time;
    }


    public int getIsMaterialForCount(){
       return isMaterialForCount;
    }
    
    public void setIsMaterialForCount(int isMaterialForCount){
       this.isMaterialForCount = isMaterialForCount;
    }

    public ENIPItemRef getIpItemRef(){
       return ipItemRef;
    }
    
    public void setIpItemRef(ENIPItemRef ipItemRef){
       this.ipItemRef = ipItemRef;
    }
    public TKMaterialsRef getMaterialRef(){
       return materialRef;
    }
    
    public void setMaterialRef(TKMaterialsRef materialRef){
       this.materialRef = materialRef;
    }

} // end of ENIPItem2TKMaterialsValueObject


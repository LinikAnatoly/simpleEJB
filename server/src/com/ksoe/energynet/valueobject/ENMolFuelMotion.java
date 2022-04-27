
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENMolFuelMotion;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENMolFuelMotionTypeRef;
    import  com.ksoe.techcard.valueobject.references.TKFuelTypeRef;
    import  com.ksoe.rqorder.valueobject.references.RQFKOrderRef;
    import  com.ksoe.energynet.valueobject.references.ENActRef;

public class ENMolFuelMotion implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  molcode; 
    public String  molname; 
    public Date dateGen ;
    public String  nn; 
    public String  mat_name; 
    public BigDecimal  countGen; 
    public long  modify_time = Long.MIN_VALUE;
    public String  userGen; 
    public Date dateEdit ;
    public ENMolFuelMotionTypeRef motionTypeRef = new ENMolFuelMotionTypeRef();
    public TKFuelTypeRef fuelTypeRef = new TKFuelTypeRef();
    public RQFKOrderRef fkorderRef = new RQFKOrderRef();
    public ENActRef actRef = new ENActRef();
    public static final String tableName = "ENMOLFUELMOTION";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENMOLFUELMOTION.CODE";
    public static final String molcode_Attr = "molcode";
    public static final String molcode_Field = "MOLCODE";
    public static final String molcode_QFielld = "ENMOLFUELMOTION.MOLCODE";
    public static final String molname_Attr = "molname";
    public static final String molname_Field = "MOLNAME";
    public static final String molname_QFielld = "ENMOLFUELMOTION.MOLNAME";
    public static final String dateGen_Attr = "dateGen";
    public static final String dateGen_Field = "DATEGEN";
    public static final String dateGen_QFielld = "ENMOLFUELMOTION.DATEGEN";
    public static final String nn_Attr = "nn";
    public static final String nn_Field = "NN";
    public static final String nn_QFielld = "ENMOLFUELMOTION.NN";
    public static final String mat_name_Attr = "mat_name";
    public static final String mat_name_Field = "MAT_NAME";
    public static final String mat_name_QFielld = "ENMOLFUELMOTION.MAT_NAME";
    public static final String countGen_Attr = "countGen";
    public static final String countGen_Field = "COUNTGEN";
    public static final String countGen_QFielld = "ENMOLFUELMOTION.COUNTGEN";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENMOLFUELMOTION.MODIFY_TIME";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENMOLFUELMOTION.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENMOLFUELMOTION.DATEEDIT";
    public static final String motionTypeRef_Attr = "motionTypeRef";
    public static final String motionTypeRef_Field = "MOTIONTYPEREFCODE";
    public static final String  motionTypeRef_QFielld = "ENMOLFUELMOTION.MOTIONTYPEREFCODE";
    public static final String fuelTypeRef_Attr = "fuelTypeRef";
    public static final String fuelTypeRef_Field = "FUELTYPEREFCODE";
    public static final String  fuelTypeRef_QFielld = "ENMOLFUELMOTION.FUELTYPEREFCODE";
    public static final String fkorderRef_Attr = "fkorderRef";
    public static final String fkorderRef_Field = "FKORDERREFCODE";
    public static final String  fkorderRef_QFielld = "ENMOLFUELMOTION.FKORDERREFCODE";
    public static final String actRef_Attr = "actRef";
    public static final String actRef_Field = "ACTREFCODE";
    public static final String  actRef_QFielld = "ENMOLFUELMOTION.ACTREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setMolcode(String aValue){
       molcode = aValue;
    }

    public String getMolcode(){
       return molcode;
    }

    public void setMolname(String aValue){
       molname = aValue;
    }

    public String getMolname(){
       return molname;
    }


    public void setDateGen(Date aValue){
       dateGen = aValue;
    }

    public Date getDateGen(){
       return dateGen;
    }

    public void setNn(String aValue){
       nn = aValue;
    }

    public String getNn(){
       return nn;
    }

    public void setMat_name(String aValue){
       mat_name = aValue;
    }

    public String getMat_name(){
       return mat_name;
    }

    public void setCountGen(BigDecimal aValue){
       countGen = aValue;
    }

    public BigDecimal getCountGen(){
       return countGen;
    }

    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
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

    public void setMotionTypeRef(ENMolFuelMotionTypeRef aValue){
       motionTypeRef = aValue;
    }

    public ENMolFuelMotionTypeRef getMotionTypeRef(){
       return motionTypeRef;
    }
    public void setFuelTypeRef(TKFuelTypeRef aValue){
       fuelTypeRef = aValue;
    }

    public TKFuelTypeRef getFuelTypeRef(){
       return fuelTypeRef;
    }
    public void setFkorderRef(RQFKOrderRef aValue){
       fkorderRef = aValue;
    }

    public RQFKOrderRef getFkorderRef(){
       return fkorderRef;
    }
    public void setActRef(ENActRef aValue){
       actRef = aValue;
    }

    public ENActRef getActRef(){
       return actRef;
    }

} // end of ENMolFuelMotionValueObject


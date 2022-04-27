
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENPlanWorkENAct2OSData;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENPlanWorkRef;
    import  com.ksoe.energynet.valueobject.references.ENActRef;

public class ENPlanWorkENAct2OSData implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public int  num_un = Integer.MIN_VALUE; 
    public int  num_unWriteOff = Integer.MIN_VALUE; 
    public String  kod_inv; 
    public String  kod_vid; 
    public String  kod_subsch_b; 
    public String  name_inv; 
    public String  kod_ist; 
    public String  name_ist; 
    public BigDecimal  sumBuhWriteOZ; 
    public BigDecimal  sumStCurrentN; 
    public BigDecimal  sumIznCurrentB; 
    public BigDecimal  sumIznCurrentN; 
    public int  typeWriteOff = Integer.MIN_VALUE; 
    public String  userGen; 
    public Date dateEdit ;
    public long  modify_time = Long.MIN_VALUE;
    public ENPlanWorkRef planWorkRef = new ENPlanWorkRef();
    public ENActRef actRef = new ENActRef();
    public static final String tableName = "ENPLANWORKENACT2OSDATA";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENPLANWORKENACT2OSDATA.CODE";
    public static final String num_un_Attr = "num_un";
    public static final String num_un_Field = "NUM_UN";
    public static final String num_un_QFielld = "ENPLANWORKENACT2OSDATA.NUM_UN";
    public static final String num_unWriteOff_Attr = "num_unWriteOff";
    public static final String num_unWriteOff_Field = "NUM_UNWRITEOFF";
    public static final String num_unWriteOff_QFielld = "ENPLANWORKENACT2OSDATA.NUM_UNWRITEOFF";
    public static final String kod_inv_Attr = "kod_inv";
    public static final String kod_inv_Field = "KOD_INV";
    public static final String kod_inv_QFielld = "ENPLANWORKENACT2OSDATA.KOD_INV";
    public static final String kod_vid_Attr = "kod_vid";
    public static final String kod_vid_Field = "KOD_VID";
    public static final String kod_vid_QFielld = "ENPLANWORKENACT2OSDATA.KOD_VID";
    public static final String kod_subsch_b_Attr = "kod_subsch_b";
    public static final String kod_subsch_b_Field = "KOD_SUBSCH_B";
    public static final String kod_subsch_b_QFielld = "ENPLANWORKENACT2OSDATA.KOD_SUBSCH_B";
    public static final String name_inv_Attr = "name_inv";
    public static final String name_inv_Field = "NAME_INV";
    public static final String name_inv_QFielld = "ENPLANWORKENACT2OSDATA.NAME_INV";
    public static final String kod_ist_Attr = "kod_ist";
    public static final String kod_ist_Field = "KOD_IST";
    public static final String kod_ist_QFielld = "ENPLANWORKENACT2OSDATA.KOD_IST";
    public static final String name_ist_Attr = "name_ist";
    public static final String name_ist_Field = "NAME_IST";
    public static final String name_ist_QFielld = "ENPLANWORKENACT2OSDATA.NAME_IST";
    public static final String sumBuhWriteOZ_Attr = "sumBuhWriteOZ";
    public static final String sumBuhWriteOZ_Field = "SUMBUHWRITEOZ";
    public static final String sumBuhWriteOZ_QFielld = "ENPLANWORKENACT2OSDATA.SUMBUHWRITEOZ";
    public static final String sumStCurrentN_Attr = "sumStCurrentN";
    public static final String sumStCurrentN_Field = "SUMSTCURRENTN";
    public static final String sumStCurrentN_QFielld = "ENPLANWORKENACT2OSDATA.SUMSTCURRENTN";
    public static final String sumIznCurrentB_Attr = "sumIznCurrentB";
    public static final String sumIznCurrentB_Field = "SUMIZNCURRENTB";
    public static final String sumIznCurrentB_QFielld = "ENPLANWORKENACT2OSDATA.SUMIZNCURRENTB";
    public static final String sumIznCurrentN_Attr = "sumIznCurrentN";
    public static final String sumIznCurrentN_Field = "SUMIZNCURRENTN";
    public static final String sumIznCurrentN_QFielld = "ENPLANWORKENACT2OSDATA.SUMIZNCURRENTN";
    public static final String typeWriteOff_Attr = "typeWriteOff";
    public static final String typeWriteOff_Field = "TYPEWRITEOFF";
    public static final String typeWriteOff_QFielld = "ENPLANWORKENACT2OSDATA.TYPEWRITEOFF";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENPLANWORKENACT2OSDATA.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENPLANWORKENACT2OSDATA.DATEEDIT";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENPLANWORKENACT2OSDATA.MODIFY_TIME";
    public static final String planWorkRef_Attr = "planWorkRef";
    public static final String planWorkRef_Field = "PLANWORKREFCODE";
    public static final String  planWorkRef_QFielld = "ENPLANWORKENACT2OSDATA.PLANWORKREFCODE";
    public static final String actRef_Attr = "actRef";
    public static final String actRef_Field = "ACTREFCODE";
    public static final String  actRef_QFielld = "ENPLANWORKENACT2OSDATA.ACTREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setNum_un(int aValue){
       num_un = aValue;
    }

    public int getNum_un(){
       return num_un;
    }

    public void setNum_unWriteOff(int aValue){
       num_unWriteOff = aValue;
    }

    public int getNum_unWriteOff(){
       return num_unWriteOff;
    }

    public void setKod_inv(String aValue){
       kod_inv = aValue;
    }

    public String getKod_inv(){
       return kod_inv;
    }

    public void setKod_vid(String aValue){
       kod_vid = aValue;
    }

    public String getKod_vid(){
       return kod_vid;
    }

    public void setKod_subsch_b(String aValue){
       kod_subsch_b = aValue;
    }

    public String getKod_subsch_b(){
       return kod_subsch_b;
    }

    public void setName_inv(String aValue){
       name_inv = aValue;
    }

    public String getName_inv(){
       return name_inv;
    }

    public void setKod_ist(String aValue){
       kod_ist = aValue;
    }

    public String getKod_ist(){
       return kod_ist;
    }

    public void setName_ist(String aValue){
       name_ist = aValue;
    }

    public String getName_ist(){
       return name_ist;
    }

    public void setSumBuhWriteOZ(BigDecimal aValue){
       sumBuhWriteOZ = aValue;
    }

    public BigDecimal getSumBuhWriteOZ(){
       return sumBuhWriteOZ;
    }

    public void setSumStCurrentN(BigDecimal aValue){
       sumStCurrentN = aValue;
    }

    public BigDecimal getSumStCurrentN(){
       return sumStCurrentN;
    }

    public void setSumIznCurrentB(BigDecimal aValue){
       sumIznCurrentB = aValue;
    }

    public BigDecimal getSumIznCurrentB(){
       return sumIznCurrentB;
    }

    public void setSumIznCurrentN(BigDecimal aValue){
       sumIznCurrentN = aValue;
    }

    public BigDecimal getSumIznCurrentN(){
       return sumIznCurrentN;
    }

    public void setTypeWriteOff(int aValue){
       typeWriteOff = aValue;
    }

    public int getTypeWriteOff(){
       return typeWriteOff;
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

    public void setPlanWorkRef(ENPlanWorkRef aValue){
       planWorkRef = aValue;
    }

    public ENPlanWorkRef getPlanWorkRef(){
       return planWorkRef;
    }
    public void setActRef(ENActRef aValue){
       actRef = aValue;
    }

    public ENActRef getActRef(){
       return actRef;
    }

} // end of ENPlanWorkENAct2OSDataValueObject


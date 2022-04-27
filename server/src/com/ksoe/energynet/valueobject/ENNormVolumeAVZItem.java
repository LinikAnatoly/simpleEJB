
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENNormVolumeAVZItem;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.techcard.valueobject.references.TKMaterialsRef;
    import  com.ksoe.energynet.valueobject.references.ENNormativeVolumeAVZRef;

public class ENNormVolumeAVZItem implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public BigDecimal  countGen; 
    public BigDecimal  countRequired; 
    public String  userGen; 
    public Date dateEdit ;
    public TKMaterialsRef materialRef = new TKMaterialsRef();
    public ENNormativeVolumeAVZRef normativeVolumeRef = new ENNormativeVolumeAVZRef();
    public static final String tableName = "ENNORMVOLUMEAVZITEM";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENNORMVOLUMEAVZITEM.CODE";
    public static final String countGen_Attr = "countGen";
    public static final String countGen_Field = "COUNTGEN";
    public static final String countGen_QFielld = "ENNORMVOLUMEAVZITEM.COUNTGEN";
    public static final String countRequired_Attr = "countRequired";
    public static final String countRequired_Field = "COUNTREQUIRED";
    public static final String countRequired_QFielld = "ENNORMVOLUMEAVZITEM.COUNTREQUIRED";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENNORMVOLUMEAVZITEM.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENNORMVOLUMEAVZITEM.DATEEDIT";
    public static final String materialRef_Attr = "materialRef";
    public static final String materialRef_Field = "MATERIALREFCODE";
    public static final String  materialRef_QFielld = "ENNORMVOLUMEAVZITEM.MATERIALREFCODE";
    public static final String normativeVolumeRef_Attr = "normativeVolumeRef";
    public static final String normativeVolumeRef_Field = "NORMATIVEVOLUMEREFCODE";
    public static final String  normativeVolumeRef_QFielld = "ENNORMVOLUMEAVZITEM.NORMATIVEVOLUMEREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setCountGen(BigDecimal aValue){
       countGen = aValue;
    }

    public BigDecimal getCountGen(){
       return countGen;
    }

    public void setCountRequired(BigDecimal aValue){
       countRequired = aValue;
    }

    public BigDecimal getCountRequired(){
       return countRequired;
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

    public void setMaterialRef(TKMaterialsRef aValue){
       materialRef = aValue;
    }

    public TKMaterialsRef getMaterialRef(){
       return materialRef;
    }
    public void setNormativeVolumeRef(ENNormativeVolumeAVZRef aValue){
       normativeVolumeRef = aValue;
    }

    public ENNormativeVolumeAVZRef getNormativeVolumeRef(){
       return normativeVolumeRef;
    }

} // end of ENNormVolumeAVZItemValueObject


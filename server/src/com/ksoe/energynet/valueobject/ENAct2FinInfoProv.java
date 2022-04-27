
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENAct2FinInfoProv;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENActRef;

public class ENAct2FinInfoProv implements Serializable {

    public int  code = Integer.MIN_VALUE;
    public int  kau_card_object_id = Integer.MIN_VALUE;
    public String  kau_card_object_kod; 
    public String  kau_card_object_name; 
    public int  kau_element_expenses_id = Integer.MIN_VALUE;
    public String  kau_element_expenses_kod; 
    public String  kau_element_expenses_name; 
    public ENActRef actRef = new ENActRef();
    public static final String tableName = "ENACT2FININFOPROV";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENACT2FININFOPROV.CODE";
    public static final String kau_card_object_id_Attr = "kau_card_object_id";
    public static final String kau_card_object_id_Field = "KAU_CARD_OBJECT_ID";
    public static final String kau_card_object_id_QFielld = "ENACT2FININFOPROV.KAU_CARD_OBJECT_ID";
    public static final String kau_card_object_kod_Attr = "kau_card_object_kod";
    public static final String kau_card_object_kod_Field = "KAU_CARD_OBJECT_KOD";
    public static final String kau_card_object_kod_QFielld = "ENACT2FININFOPROV.KAU_CARD_OBJECT_KOD";
    public static final String kau_card_object_name_Attr = "kau_card_object_name";
    public static final String kau_card_object_name_Field = "KAU_CARD_OBJECT_NAME";
    public static final String kau_card_object_name_QFielld = "ENACT2FININFOPROV.KAU_CARD_OBJECT_NAME";
    public static final String kau_element_expenses_id_Attr = "kau_element_expenses_id";
    public static final String kau_element_expenses_id_Field = "KAU_ELEMENT_EXPENSES_ID";
    public static final String kau_element_expenses_id_QFielld = "ENACT2FININFOPROV.KAU_ELEMENT_EXPENSES_D";
    public static final String kau_element_expenses_kod_Attr = "kau_element_expenses_kod";
    public static final String kau_element_expenses_kod_Field = "KAU_ELEMENT_EXPENSES_KOD";
    public static final String kau_element_expenses_kod_QFielld = "ENACT2FININFOPROV.KAU_ELEMENT_EXPENSS_KD";
    public static final String kau_element_expenses_name_Attr = "kau_element_expenses_name";
    public static final String kau_element_expenses_name_Field = "KAU_ELEMENT_EXPENSES_NAME";
    public static final String kau_element_expenses_name_QFielld = "ENACT2FININFOPROV.KAU_ELEMENT_EXPENSS_NM";
    public static final String actRef_Attr = "actRef";
    public static final String actRef_Field = "ACTREFCODE";
    public static final String  actRef_QFielld = "ENACT2FININFOPROV.ACTREFCODE";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setKau_card_object_id(int aValue){
       kau_card_object_id = aValue;
    }

    public int getKau_card_object_id(){
       return kau_card_object_id;
    }


    public void setKau_card_object_kod(String aValue){
       kau_card_object_kod = aValue;
    }

    public String getKau_card_object_kod(){
       return kau_card_object_kod;
    }


    public void setKau_card_object_name(String aValue){
       kau_card_object_name = aValue;
    }

    public String getKau_card_object_name(){
       return kau_card_object_name;
    }


    public void setKau_element_expenses_id(int aValue){
       kau_element_expenses_id = aValue;
    }

    public int getKau_element_expenses_id(){
       return kau_element_expenses_id;
    }


    public void setKau_element_expenses_kod(String aValue){
       kau_element_expenses_kod = aValue;
    }

    public String getKau_element_expenses_kod(){
       return kau_element_expenses_kod;
    }


    public void setKau_element_expenses_name(String aValue){
       kau_element_expenses_name = aValue;
    }

    public String getKau_element_expenses_name(){
       return kau_element_expenses_name;
    }

    public void setActRef(ENActRef aValue){
       actRef = aValue;
    }

    public ENActRef getActRef(){
       return actRef;
    }

} // end of ENAct2FinInfoProvValueObject


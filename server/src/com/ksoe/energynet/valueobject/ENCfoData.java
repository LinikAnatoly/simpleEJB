
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENCfoDataENCfoData;  	
  */

import java.io.Serializable;


public class ENCfoData implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  txtCode; 
    public int  fkID = Integer.MIN_VALUE; 
    public int  frc_list_id = Integer.MIN_VALUE; 
    public String  name; 
    public static final String tableName = "ENCFODATA";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENCFODATA.CODE";
    public static final String txtCode_Attr = "txtCode";
    public static final String txtCode_Field = "TXTCODE";
    public static final String txtCode_QFielld = "ENCFODATA.TXTCODE";
    public static final String fkID_Attr = "fkID";
    public static final String fkID_Field = "FKID";
    public static final String fkID_QFielld = "ENCFODATA.FKID";
    public static final String frc_list_id_Attr = "frc_list_id";
    public static final String frc_list_id_Field = "FRC_LIST_ID";
    public static final String frc_list_id_QFielld = "ENCFODATA.FRC_LIST_ID";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENCFODATA.NAME";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setTxtCode(String aValue){
       txtCode = aValue;
    }

    public String getTxtCode(){
       return txtCode;
    }

    public void setFkID(int aValue){
       fkID = aValue;
    }

    public int getFkID(){
       return fkID;
    }

    public void setFrc_list_id(int aValue){
       frc_list_id = aValue;
    }

    public int getFrc_list_id(){
       return frc_list_id;
    }

    public void setName(String aValue){
       name = aValue;
    }

    public String getName(){
       return name;
    }

;

} // end of ENCfoDataValueObject


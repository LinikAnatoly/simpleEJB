
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENSITFeatureENSITFeature;  	
  */

import java.io.Serializable;

public class ENSITFeature implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public String  value; 
    public ENSITEquipment equipment = new ENSITEquipment();
    public ENSITFeatureType featureType = new ENSITFeatureType();
    public static final String tableName = "ENSITFEATURE";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENSITFEATURE.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENSITFEATURE.NAME";
    public static final String value_Attr = "value";
    public static final String value_Field = "VALUE";
    public static final String value_QFielld = "ENSITFEATURE.VALUE";
    public static final String equipment_Attr = "equipment";
    public static final String equipment_Field = "EQUIPMENTCODE";
    public static final String  equipment_QFielld = "ENSITFEATURE.EQUIPMENTCODE";
    public static final String featureType_Attr = "featureType";
    public static final String featureType_Field = "FEATURETYPECODE";
    public static final String  featureType_QFielld = "ENSITFEATURE.FEATURETYPECODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setName(String aValue){
       name = aValue;
    }

    public String getName(){
       return name;
    }

    public void setValue(String aValue){
       value = aValue;
    }

    public String getValue(){
       return value;
    }

;
    public void setEquipment(ENSITEquipment aValue){
       equipment = aValue;
    }

    public ENSITEquipment getEquipment(){
       return equipment;
    }
    public void setFeatureType(ENSITFeatureType aValue){
       featureType = aValue;
    }

    public ENSITFeatureType getFeatureType(){
       return featureType;
    }

} // end of ENSITFeatureValueObject


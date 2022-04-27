
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENSITFeatureHistoryENSITFeatureHistory;  	
  */

import java.io.Serializable;
import java.util.Date;

public class ENSITFeatureHistory implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public String  newvalue; 
    public String  oldvalue; 
    public Date  dategen; 
    public ENSITEquipment equipment = new ENSITEquipment();
    public ENSITFeature featureType = new ENSITFeature();
    public static final String tableName = "ENSITFEATUREHISTORY";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENSITFEATUREHISTORY.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENSITFEATUREHISTORY.NAME";
    public static final String newvalue_Attr = "newvalue";
    public static final String newvalue_Field = "NEWVALUE";
    public static final String newvalue_QFielld = "ENSITFEATUREHISTORY.NEWVALUE";
    public static final String oldvalue_Attr = "oldvalue";
    public static final String oldvalue_Field = "OLDVALUE";
    public static final String oldvalue_QFielld = "ENSITFEATUREHISTORY.OLDVALUE";
    public static final String dategen_Attr = "dategen";
    public static final String dategen_Field = "DATEGEN";
    public static final String dategen_QFielld = "ENSITFEATUREHISTORY.DATEGEN";
    public static final String equipment_Attr = "equipment";
    public static final String equipment_Field = "EQUIPMENTCODE";
    public static final String  equipment_QFielld = "ENSITFEATUREHISTORY.EQUIPMENTCODE";
    public static final String featureType_Attr = "featureType";
    public static final String featureType_Field = "FEATURETYPECODE";
    public static final String  featureType_QFielld = "ENSITFEATUREHISTORY.FEATURETYPECODE";


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

    public void setNewvalue(String aValue){
       newvalue = aValue;
    }

    public String getNewvalue(){
       return newvalue;
    }

    public void setOldvalue(String aValue){
       oldvalue = aValue;
    }

    public String getOldvalue(){
       return oldvalue;
    }

    public void setDategen(Date aValue){
       dategen = aValue;
    }

    public Date getDategen(){
       return dategen;
    }

;
    public void setEquipment(ENSITEquipment aValue){
       equipment = aValue;
    }

    public ENSITEquipment getEquipment(){
       return equipment;
    }
    public void setFeatureType(ENSITFeature aValue){
       featureType = aValue;
    }

    public ENSITFeature getFeatureType(){
       return featureType;
    }

} // end of ENSITFeatureHistoryValueObject


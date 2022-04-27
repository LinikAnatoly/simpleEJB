
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENSITFeatureTypeENSITFeatureType;  	
  */

import java.io.Serializable;


public class ENSITFeatureType implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public int  sorter = Integer.MIN_VALUE; 
    public String  desc; 
    public int  po = Integer.MIN_VALUE; 
    public static final String tableName = "ENSITFEATURETYPE";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENSITFEATURETYPE.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENSITFEATURETYPE.NAME";
    public static final String sorter_Attr = "sorter";
    public static final String sorter_Field = "SORTER";
    public static final String sorter_QFielld = "ENSITFEATURETYPE.SORTER";
    public static final String desc_Attr = "desc";
    public static final String desc_Field = "DESC";
    public static final String desc_QFielld = "ENSITFEATURETYPE.DESC";
    public static final String po_Attr = "po";
    public static final String po_Field = "PO";
    public static final String po_QFielld = "ENSITFEATURETYPE.PO";


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

    public void setSorter(int aValue){
       sorter = aValue;
    }

    public int getSorter(){
       return sorter;
    }

    public void setDesc(String aValue){
       desc = aValue;
    }

    public String getDesc(){
       return desc;
    }

    public void setPo(int aValue){
       po = aValue;
    }

    public int getPo(){
       return po;
    }

;

} // end of ENSITFeatureTypeValueObject


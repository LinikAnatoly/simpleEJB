
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENFuelInventarizationStatus;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENFuelInventarizationStatus implements Serializable {

	public static final int DRAFT = 1;
	public static final int ITEMS_GENERATED = 2;
	public static final int FACT_QUANTITY_INSERTED = 3;
    public static final int FUEL_RESERVED = 4;
    public static final int CLOSED = 5;
	
    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public static final String tableName = "ENFUELINVENTARIZTNSTTS";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENFUELINVENTARIZTNSTTS.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENFUELINVENTARIZTNSTTS.NAME";


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


} // end of ENFuelInventarizationStatusValueObject


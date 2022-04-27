
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENServicesContragentTypeENServicesContragentType;  	
  */

import java.io.Serializable;


public class ENServicesContragentType implements Serializable {

	public static final int PHYSICAL = 1;             // Фізична особа
	public static final int JURIDICAL_BUDGET = 2;     // Юр. особа (бюджет)
	public static final int JURIDICAL_NONBUDGET = 3;  // Юр. особа (не бюджет)
	public static final int PHYSICAL_NOREZIDENT = 4;  // Фізична особа - нерезидент
	public static final int JURIDICAL_NOREZIDENT = 5; // Юридична особа - нерезидент
	
    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public static final String tableName = "ENSERVICESCONTRAGENTTP";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENSERVICESCONTRAGENTTP.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENSERVICESCONTRAGENTTP.NAME";


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

;

} // end of ENServicesContragentTypeValueObject


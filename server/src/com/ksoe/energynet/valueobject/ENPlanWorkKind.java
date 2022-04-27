
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENPlanWorkKindENPlanWorkKind;
  */

import java.io.Serializable;


public class ENPlanWorkKind implements Serializable {

	public static final int YEAR = 1;
	public static final int CURRENT = 2;
	public static final int NPW = 3; // нормированное наряд задание
	public static final int FACT = 4;
	public static final int CALCULATION = 5; // Калькуляция ("кошторис")
	public static final int CALCULATION_SINGLE = 6; // Калькуляция для единичной работы ("кошторис")

	/** спецификация на продажу товара */
	public static final int SALE_SPECIFICATION = 7;


    public int  code = Integer.MIN_VALUE;
    public String  name;
    public static final String tableName = "ENPLANWORKKIND";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENPLANWORKKIND.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENPLANWORKKIND.NAME";


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

} // end of ENPlanWorkKindValueObject



//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENElement2ENElementType;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENElement2ENElementType implements Serializable {

private static final long serialVersionUID = 1L;

	/** Константа для связки договоров аренды (ОКСН Допуск с ОКСН ТУ)*/
	public static final int SERVICES_OKSN_ACCESS_WITH_OKSN_TU = 1;
	
	/** Константа для связки договоров аренды (ОКСН узгодження с ОКСН ТУ)*/
	public static final int SERVICES_OKSN_AGREE_WITH_OKSN_TU = 2;
	
	/** Константа для связки договоров аренды (ОКСН відшкодування с ОКСН ТУ)*/
	public static final int SERVICES_OKSN_WORK_WITH_OKSN_TU = 3;
	
	/** Константа для связки договоров аренды (ОКСН внесення змін до ТУ с ОКСН ТУ)*/
	public static final int SERVICES_OKSN_TU_MODIFY_WITH_OKSN_TU = 4;

	/**З'вязок між договорами (Послуги на сторону та Приєднання)*/
	public static final int SERVICES_OBJECT_BIND_CALCULATION_TO_CONNECTION = 5;

    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public static final String tableName = "ENELEMENT2ENELEMENTTYP";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENELEMENT2ENELEMENTTYP.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENELEMENT2ENELEMENTTYP.NAME";



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


} // end of ENElement2ENElementTypeValueObject



//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENTechConditionsServicesStatus;
  */

import java.io.Serializable;


public class ENTechConditionsServicesStatus implements Serializable {

	/** статус договора о выполнении ТУ - черновой */
	public static final int NEW = 1;

	/** статус договора о выполнении ТУ - подписан */
	public static final int SIGNED = 2;

	/** статус договора о выполнении ТУ - завершённый */
	public static final int COMPLETED = 3;


    public int  code = Integer.MIN_VALUE;
    public String  name;
    public static final String tableName = "ENTECHCONDTNSSRVCSSTTS";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENTECHCONDTNSSRVCSSTTS.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENTECHCONDTNSSRVCSSTTS.NAME";


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


} // end of ENTechConditionsServicesStatusValueObject


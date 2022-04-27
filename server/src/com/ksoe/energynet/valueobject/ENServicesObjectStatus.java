
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENServicesObjectStatus;  	
  */

import java.io.Serializable;


public class ENServicesObjectStatus implements Serializable {

	public static final int GOOD = 1;   // Чорновий
	public static final int CLOSED = 2; // Проведений у ФК
	public static final int ACT_TRANSFER_CLOSED = 3;  // Матеріали Замовника оприбутковано
	public static final int CLOSED_BY_BUH_SPRAV = 4; // Проведений згідно бухдовідки
	
    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public static final String tableName = "ENSERVICESOBJECTSTATUS";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENSERVICESOBJECTSTATUS.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENSERVICESOBJECTSTATUS.NAME";


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


} // end of ENServicesObjectStatusValueObject



//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for SCSealStatus;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class SCSealStatus implements Serializable {

	/** Дійсна */
	public static final int GOOD = 1;
	/** Зіпсована */
	public static final int SPOILED = 2;
	/** Встановлена на особовому рахунку */
	public static final int INSTALLED = 3;
	/** Знята з особового рахунку (демонтована) */
	public static final int UNINSTALLED = 4;
	
	/**
	 * 
	 * Возвращает "активные" статусы пломб - то есть те которые отображаются в акте выполненных работ
	 * 
	 * @return
	 */
	public static final int[] getActiveSCSealStatuses() {
		return new int[] {GOOD, INSTALLED};
	}
	
	//public static final int IN_ACT = 2;
	//public static final int CANCELED = 100;
	
    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public static final String tableName = "SCSEALSTATUS";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "SCSEALSTATUS.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "SCSEALSTATUS.NAME";



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


} // end of SCSealStatusValueObject


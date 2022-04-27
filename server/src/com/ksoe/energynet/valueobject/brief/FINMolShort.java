
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for FINMol;  	
  */

import java.io.Serializable;

import com.ksoe.fin.logic.FKConsts;
import com.ksoe.fin.valueobject.brief.OSMolShort;


public class FINMolShort implements Serializable {

    //public int id = Integer.MIN_VALUE; 
    public String id;
    public String text; 
    public int obj_id = Integer.MIN_VALUE; 
    public int state = Integer.MIN_VALUE; 
    public String axReceiptBlocking;
    public String axIssueBlocking;


    public void setId(String aValue){
       id = aValue;
    }
    public String getId(){
       return id;
    }
	
    public void setText(String aValue){
       text = aValue;
    }
    public String getText(){
       return text;
    }
	
    public void setObj_id(int aValue){
       obj_id = aValue;
    }
    public int getObj_id(){
       return obj_id;
    }
	
    public void setState(int aValue){
       state = aValue;
    }
    public int getState(){
       return state;
    }
	
	public void setAxReceiptBlocking(String aValue){
		axReceiptBlocking = aValue;
	}

	public String getAxReceiptBlocking(){
		return axReceiptBlocking;
	}

	public void setAxIssueBlocking(String aValue){
		axIssueBlocking = aValue;
	}

	public String getAxIssueBlocking(){
		return axIssueBlocking;
	}
	
	/**
	 * 
	 * Создание объекта МОЛ Учета материалов {@link FINMolShort} 
	 * из объекта МОЛ Основных {@link OSMolShort}
	 * 
	 * @param osMol объект МОЛ Основных средств {@link OSMolShort}
	 * @return объект МОЛ Учета материалов {@link FINMolShort}
	 */
	public static final FINMolShort createObjectFromOSMolShort(OSMolShort osMol) {
		if(osMol == null || osMol.kod_mol.length() == 0) 
			throw new java.lang.NullPointerException(); 
		FINMolShort mol = new FINMolShort();
		mol.id = osMol.kod_mol;
		mol.text = osMol.name_mol;
		mol.state = (osMol.d_likv != null) ? FKConsts.TDIVISION_STATE_INACTIVE : FKConsts.TDIVISION_STATE_ACTIVE;
		return mol;
	}



}
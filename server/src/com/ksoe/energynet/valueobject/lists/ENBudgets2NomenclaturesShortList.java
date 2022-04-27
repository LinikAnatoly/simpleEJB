
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENBudgets2Nomenclatures;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENBudgets2NomenclaturesShort;

public class ENBudgets2NomenclaturesShortList implements Serializable {

	public int totalCount = 0;
	public Vector<ENBudgets2NomenclaturesShort> list = new Vector<ENBudgets2NomenclaturesShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENBudgets2NomenclaturesShort> getList() {return list;}
	public final void setList(Vector<ENBudgets2NomenclaturesShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENBudgets2NomenclaturesShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENBudgets2Nomenclatures


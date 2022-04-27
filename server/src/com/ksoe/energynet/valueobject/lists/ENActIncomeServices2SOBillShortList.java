
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENActIncomeServices2SOBill;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENActIncomeServices2SOBillShort;

public class ENActIncomeServices2SOBillShortList implements Serializable {

	private static final long serialVersionUID = 1L;

	public int totalCount = 0;
	public Vector<ENActIncomeServices2SOBillShort> list = new Vector<ENActIncomeServices2SOBillShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENActIncomeServices2SOBillShort> getList() {return list;}
	public final void setList(Vector<ENActIncomeServices2SOBillShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENActIncomeServices2SOBillShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENActIncomeServices2SOBill


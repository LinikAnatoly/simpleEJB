
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENPlanInformCustomer;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENPlanInformCustomerShort;

public class ENPlanInformCustomerShortList implements Serializable {

	public int totalCount = 0;
	public Vector<ENPlanInformCustomerShort> list = new Vector<ENPlanInformCustomerShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENPlanInformCustomerShort> getList() {return list;}
	public final void setList(Vector<ENPlanInformCustomerShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENPlanInformCustomerShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENPlanInformCustomer


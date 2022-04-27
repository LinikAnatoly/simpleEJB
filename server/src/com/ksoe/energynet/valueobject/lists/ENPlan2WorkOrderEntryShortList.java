
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENPlan2WorkOrderEntry;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENPlan2WorkOrderEntryShort;

public class ENPlan2WorkOrderEntryShortList implements Serializable {

	private static final long serialVersionUID = 1L;

	public int totalCount = 0;
	public Vector<ENPlan2WorkOrderEntryShort> list = new Vector<ENPlan2WorkOrderEntryShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENPlan2WorkOrderEntryShort> getList() {return list;}
	public final void setList(Vector<ENPlan2WorkOrderEntryShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENPlan2WorkOrderEntryShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENPlan2WorkOrderEntry


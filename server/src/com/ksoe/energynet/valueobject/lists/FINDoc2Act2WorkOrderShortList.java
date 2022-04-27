
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for FINDoc2Act2WorkOrder;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.FINDoc2Act2WorkOrderShort;

public class FINDoc2Act2WorkOrderShortList implements Serializable {

	public int totalCount = 0;
	public Vector<FINDoc2Act2WorkOrderShort> list = new Vector<FINDoc2Act2WorkOrderShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<FINDoc2Act2WorkOrderShort> getList() {return list;}
	public final void setList(Vector<FINDoc2Act2WorkOrderShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.FINDoc2Act2WorkOrderShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for FINDoc2Act2WorkOrder


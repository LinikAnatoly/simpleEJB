
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENTransportRealRepair;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENTransportRealRepairShort;

public class ENTransportRealRepairShortList implements Serializable {

	private static final long serialVersionUID = 1L;

	public int totalCount = 0;
	public Vector<ENTransportRealRepairShort> list = new Vector<ENTransportRealRepairShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENTransportRealRepairShort> getList() {return list;}
	public final void setList(Vector<ENTransportRealRepairShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENTransportRealRepairShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENTransportRealRepair


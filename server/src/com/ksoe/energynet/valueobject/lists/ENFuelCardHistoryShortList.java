
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2022 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENFuelCardHistory;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENFuelCardHistoryShort;

public class ENFuelCardHistoryShortList implements Serializable {

	private static final long serialVersionUID = 1L;

	public int totalCount = 0;
	public Vector<ENFuelCardHistoryShort> list = new Vector<ENFuelCardHistoryShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENFuelCardHistoryShort> getList() {return list;}
	public final void setList(Vector<ENFuelCardHistoryShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENFuelCardHistoryShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENFuelCardHistory


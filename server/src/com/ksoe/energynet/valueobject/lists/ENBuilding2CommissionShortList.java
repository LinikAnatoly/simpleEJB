
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENBuilding2Commission;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENBuilding2CommissionShort;

public class ENBuilding2CommissionShortList implements Serializable {

	private static final long serialVersionUID = 1L;

	public int totalCount = 0;
	public Vector<ENBuilding2CommissionShort> list = new Vector<ENBuilding2CommissionShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENBuilding2CommissionShort> getList() {return list;}
	public final void setList(Vector<ENBuilding2CommissionShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENBuilding2CommissionShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENBuilding2Commission


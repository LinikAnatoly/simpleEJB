
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENServices2Plan;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENServices2PlanShort;

public class ENServices2PlanShortList implements Serializable {

	public int totalCount = 0;
	public Vector<ENServices2PlanShort> list = new Vector<ENServices2PlanShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENServices2PlanShort> getList() {return list;}
	public final void setList(Vector<ENServices2PlanShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENServices2PlanShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENServices2Plan


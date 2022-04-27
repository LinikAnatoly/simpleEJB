
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENPlanWorkItem2Graph;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENPlanWorkItem2GraphShort;

public class ENPlanWorkItem2GraphShortList implements Serializable {

	public int totalCount = 0;
	public Vector<ENPlanWorkItem2GraphShort> list = new Vector<ENPlanWorkItem2GraphShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENPlanWorkItem2GraphShort> getList() {return list;}
	public final void setList(Vector<ENPlanWorkItem2GraphShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENPlanWorkItem2GraphShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENPlanWorkItem2Graph


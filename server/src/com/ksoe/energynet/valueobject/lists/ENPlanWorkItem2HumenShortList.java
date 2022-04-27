
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENPlanWorkItem2Humen;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENPlanWorkItem2HumenShort;

public class ENPlanWorkItem2HumenShortList implements Serializable {

	private static final long serialVersionUID = 1L;

	public int totalCount = 0;
	public Vector<ENPlanWorkItem2HumenShort> list = new Vector<ENPlanWorkItem2HumenShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENPlanWorkItem2HumenShort> getList() {return list;}
	public final void setList(Vector<ENPlanWorkItem2HumenShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENPlanWorkItem2HumenShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENPlanWorkItem2Humen


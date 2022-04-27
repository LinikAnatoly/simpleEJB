
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENElement2Distance;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENElement2DistanceShort;

public class ENElement2DistanceShortList implements Serializable {

	private static final long serialVersionUID = 1L;

	public int totalCount = 0;
	public Vector<ENElement2DistanceShort> list = new Vector<ENElement2DistanceShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENElement2DistanceShort> getList() {return list;}
	public final void setList(Vector<ENElement2DistanceShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENElement2DistanceShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENElement2Distance


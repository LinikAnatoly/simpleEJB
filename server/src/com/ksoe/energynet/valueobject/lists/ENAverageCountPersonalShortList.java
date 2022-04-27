
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENAverageCountPersonal;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENAverageCountPersonalShort;

public class ENAverageCountPersonalShortList implements Serializable {

	public int totalCount = 0;
	public Vector<ENAverageCountPersonalShort> list = new Vector<ENAverageCountPersonalShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENAverageCountPersonalShort> getList() {return list;}
	public final void setList(Vector<ENAverageCountPersonalShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENAverageCountPersonalShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENAverageCountPersonal


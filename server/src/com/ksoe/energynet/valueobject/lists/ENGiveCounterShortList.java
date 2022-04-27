
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENGiveCounter;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENGiveCounterShort;

public class ENGiveCounterShortList implements Serializable {

	public int totalCount = 0;
	public Vector<ENGiveCounterShort> list = new Vector<ENGiveCounterShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENGiveCounterShort> getList() {return list;}
	public final void setList(Vector<ENGiveCounterShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENGiveCounterShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENGiveCounter


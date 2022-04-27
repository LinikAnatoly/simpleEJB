
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENServicesObjectKindFK;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENServicesObjectKindFKShort;

public class ENServicesObjectKindFKShortList implements Serializable {

	public int totalCount = 0;
	public Vector<ENServicesObjectKindFKShort> list = new Vector<ENServicesObjectKindFKShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENServicesObjectKindFKShort> getList() {return list;}
	public final void setList(Vector<ENServicesObjectKindFKShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENServicesObjectKindFKShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENServicesObjectKindFK


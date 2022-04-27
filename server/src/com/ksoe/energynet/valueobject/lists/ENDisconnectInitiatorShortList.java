
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENDisconnectInitiator;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENDisconnectInitiatorShort;

public class ENDisconnectInitiatorShortList implements Serializable {

	private static final long serialVersionUID = 1L;

	public int totalCount = 0;
	public Vector<ENDisconnectInitiatorShort> list = new Vector<ENDisconnectInitiatorShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENDisconnectInitiatorShort> getList() {return list;}
	public final void setList(Vector<ENDisconnectInitiatorShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENDisconnectInitiatorShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENDisconnectInitiator


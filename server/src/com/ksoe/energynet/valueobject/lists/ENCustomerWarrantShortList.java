
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENCustomerWarrant;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENCustomerWarrantShort;

public class ENCustomerWarrantShortList implements Serializable {

	private static final long serialVersionUID = 1L;

	public int totalCount = 0;
	public Vector<ENCustomerWarrantShort> list = new Vector<ENCustomerWarrantShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENCustomerWarrantShort> getList() {return list;}
	public final void setList(Vector<ENCustomerWarrantShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENCustomerWarrantShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENCustomerWarrant


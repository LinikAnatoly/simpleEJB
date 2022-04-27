
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for FINContracts;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.FINContractsShort;

public class FINContractsShortList implements Serializable {

	public int totalCount = 0;
	public Vector<FINContractsShort> list = new Vector<FINContractsShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<FINContractsShort> getList() {return list;}
	public final void setList(Vector<FINContractsShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.FINContractsShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for FINContracts


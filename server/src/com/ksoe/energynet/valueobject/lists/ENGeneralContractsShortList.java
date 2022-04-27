
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENGeneralContracts;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENGeneralContractsShort;

public class ENGeneralContractsShortList implements Serializable {

	public int totalCount = 0;
	public Vector<ENGeneralContractsShort> list = new Vector<ENGeneralContractsShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENGeneralContractsShort> getList() {return list;}
	public final void setList(Vector<ENGeneralContractsShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENGeneralContractsShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENGeneralContracts


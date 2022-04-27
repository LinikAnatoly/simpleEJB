
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENContractType;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENContractTypeShort;

public class ENContractTypeShortList implements Serializable {

	public int totalCount = 0;
	public Vector<ENContractTypeShort> list = new Vector<ENContractTypeShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENContractTypeShort> getList() {return list;}
	public final void setList(Vector<ENContractTypeShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENContractTypeShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENContractType


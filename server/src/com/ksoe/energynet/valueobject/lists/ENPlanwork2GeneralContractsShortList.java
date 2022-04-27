
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENPlanwork2GeneralContracts;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENPlanwork2GeneralContractsShort;

public class ENPlanwork2GeneralContractsShortList implements Serializable {

	private static final long serialVersionUID = 1L;

	public int totalCount = 0;
	public Vector<ENPlanwork2GeneralContractsShort> list = new Vector<ENPlanwork2GeneralContractsShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENPlanwork2GeneralContractsShort> getList() {return list;}
	public final void setList(Vector<ENPlanwork2GeneralContractsShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENPlanwork2GeneralContractsShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENPlanwork2GeneralContracts


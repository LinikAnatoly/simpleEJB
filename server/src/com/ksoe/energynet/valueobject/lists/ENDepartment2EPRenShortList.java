
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENDepartment2EPRen;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENDepartment2EPRenShort;

public class ENDepartment2EPRenShortList implements Serializable {

	private static final long serialVersionUID = 1L;

	public int totalCount = 0;
	public Vector<ENDepartment2EPRenShort> list = new Vector<ENDepartment2EPRenShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENDepartment2EPRenShort> getList() {return list;}
	public final void setList(Vector<ENDepartment2EPRenShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENDepartment2EPRenShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENDepartment2EPRen


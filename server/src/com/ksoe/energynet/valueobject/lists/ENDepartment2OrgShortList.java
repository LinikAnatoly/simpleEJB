
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENDepartment2Org;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENDepartment2OrgShort;

public class ENDepartment2OrgShortList implements Serializable {

	private static final long serialVersionUID = 1L;

	public int totalCount = 0;
	public Vector<ENDepartment2OrgShort> list = new Vector<ENDepartment2OrgShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENDepartment2OrgShort> getList() {return list;}
	public final void setList(Vector<ENDepartment2OrgShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENDepartment2OrgShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENDepartment2Org


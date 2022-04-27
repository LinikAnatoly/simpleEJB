
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENGeoDep2ENDepartment;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENGeoDep2ENDepartmentShort;

public class ENGeoDep2ENDepartmentShortList implements Serializable {

	private static final long serialVersionUID = 1L;

	public int totalCount = 0;
	public Vector<ENGeoDep2ENDepartmentShort> list = new Vector<ENGeoDep2ENDepartmentShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENGeoDep2ENDepartmentShort> getList() {return list;}
	public final void setList(Vector<ENGeoDep2ENDepartmentShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENGeoDep2ENDepartmentShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENGeoDep2ENDepartment


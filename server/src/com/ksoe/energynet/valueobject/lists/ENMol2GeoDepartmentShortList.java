
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENMol2GeoDepartment;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENMol2GeoDepartmentShort;

public class ENMol2GeoDepartmentShortList implements Serializable {

	private static final long serialVersionUID = 1L;

	public int totalCount = 0;
	public Vector<ENMol2GeoDepartmentShort> list = new Vector<ENMol2GeoDepartmentShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENMol2GeoDepartmentShort> getList() {return list;}
	public final void setList(Vector<ENMol2GeoDepartmentShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENMol2GeoDepartmentShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENMol2GeoDepartment


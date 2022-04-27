
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENRegForSupplierStatus;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENRegForSupplierStatusShort;

public class ENRegForSupplierStatusShortList implements Serializable {

	private static final long serialVersionUID = 1L;

	public int totalCount = 0;
	public Vector<ENRegForSupplierStatusShort> list = new Vector<ENRegForSupplierStatusShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENRegForSupplierStatusShort> getList() {return list;}
	public final void setList(Vector<ENRegForSupplierStatusShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENRegForSupplierStatusShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENRegForSupplierStatus



//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENIPItem2TKMaterials;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENIPItem2TKMaterialsShort;

public class ENIPItem2TKMaterialsShortList implements Serializable {

	private static final long serialVersionUID = 1L;

	public int totalCount = 0;
	public Vector<ENIPItem2TKMaterialsShort> list = new Vector<ENIPItem2TKMaterialsShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENIPItem2TKMaterialsShort> getList() {return list;}
	public final void setList(Vector<ENIPItem2TKMaterialsShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENIPItem2TKMaterialsShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENIPItem2TKMaterials


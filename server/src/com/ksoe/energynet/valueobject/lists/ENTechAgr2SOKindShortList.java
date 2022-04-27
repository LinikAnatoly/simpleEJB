
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENTechAgr2SOKind;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENTechAgr2SOKindShort;

public class ENTechAgr2SOKindShortList implements Serializable {

	public int totalCount = 0;
	public Vector<ENTechAgr2SOKindShort> list = new Vector<ENTechAgr2SOKindShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENTechAgr2SOKindShort> getList() {return list;}
	public final void setList(Vector<ENTechAgr2SOKindShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENTechAgr2SOKindShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENTechAgr2SOKind


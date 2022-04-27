
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENCalcAdditionalItemType;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENCalcAdditionalItemTypeShort;

public class ENCalcAdditionalItemTypeShortList implements Serializable {

	public int totalCount = 0;
	public Vector<ENCalcAdditionalItemTypeShort> list = new Vector<ENCalcAdditionalItemTypeShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENCalcAdditionalItemTypeShort> getList() {return list;}
	public final void setList(Vector<ENCalcAdditionalItemTypeShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENCalcAdditionalItemTypeShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENCalcAdditionalItemType



//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENActPostingTypeSum;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENActPostingTypeSumShort;

public class ENActPostingTypeSumShortList implements Serializable {

	private static final long serialVersionUID = 1L;

	public int totalCount = 0;
	public Vector<ENActPostingTypeSumShort> list = new Vector<ENActPostingTypeSumShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENActPostingTypeSumShort> getList() {return list;}
	public final void setList(Vector<ENActPostingTypeSumShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENActPostingTypeSumShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENActPostingTypeSum


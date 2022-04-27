
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENConnectionCityType;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENConnectionCityTypeShort;

public class ENConnectionCityTypeShortList implements Serializable {

	private static final long serialVersionUID = 1L;

	public int totalCount = 0;
	public Vector<ENConnectionCityTypeShort> list = new Vector<ENConnectionCityTypeShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENConnectionCityTypeShort> getList() {return list;}
	public final void setList(Vector<ENConnectionCityTypeShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENConnectionCityTypeShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENConnectionCityType


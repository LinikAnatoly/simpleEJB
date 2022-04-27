
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENConnectionPowerPoint;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENConnectionPowerPointShort;

public class ENConnectionPowerPointShortList implements Serializable {

	private static final long serialVersionUID = 1L;

	public int totalCount = 0;
	public Vector<ENConnectionPowerPointShort> list = new Vector<ENConnectionPowerPointShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENConnectionPowerPointShort> getList() {return list;}
	public final void setList(Vector<ENConnectionPowerPointShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENConnectionPowerPointShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENConnectionPowerPoint


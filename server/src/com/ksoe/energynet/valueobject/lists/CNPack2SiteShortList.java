
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for CNPack2Site;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.CNPack2SiteShort;

public class CNPack2SiteShortList implements Serializable {

	public int totalCount = 0;
	public Vector<CNPack2SiteShort> list = new Vector<CNPack2SiteShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<CNPack2SiteShort> getList() {return list;}
	public final void setList(Vector<CNPack2SiteShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.CNPack2SiteShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for CNPack2Site


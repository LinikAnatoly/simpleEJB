
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENPlanWork2ClassificationType;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENPlanWork2ClassificationTypeShort;

public class ENPlanWork2ClassificationTypeShortList implements Serializable {

	private static final long serialVersionUID = 1L;

	public int totalCount = 0;
	public Vector<ENPlanWork2ClassificationTypeShort> list = new Vector<ENPlanWork2ClassificationTypeShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENPlanWork2ClassificationTypeShort> getList() {return list;}
	public final void setList(Vector<ENPlanWork2ClassificationTypeShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENPlanWork2ClassificationTypeShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENPlanWork2ClassificationType


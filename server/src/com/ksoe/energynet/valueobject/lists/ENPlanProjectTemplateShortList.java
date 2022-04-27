
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENPlanProjectTemplate;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENPlanProjectTemplateShort;

public class ENPlanProjectTemplateShortList implements Serializable {

	private static final long serialVersionUID = 1L;

	public int totalCount = 0;
	public Vector<ENPlanProjectTemplateShort> list = new Vector<ENPlanProjectTemplateShort>();

	public final int getTotalCount() {return totalCount;}
	public final void setTotalCount(int aValue) {totalCount = aValue;}

	public final Vector<ENPlanProjectTemplateShort> getList() {return list;}
	public final void setList(Vector<ENPlanProjectTemplateShort> aValue) {list = aValue;}

	public final com.ksoe.energynet.valueobject.brief.ENPlanProjectTemplateShort get(int anIndex) {
		return list.get(anIndex);
	}

	public final int size() {
		return (list == null)?0:list.size();
	}

} // end of List for ENPlanProjectTemplate


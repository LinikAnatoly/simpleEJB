
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENWorkOrder2ENPlanWork;  	
  */

import java.io.Serializable;
import java.util.Vector;

import com.ksoe.energynet.valueobject.brief.ENWorkOrder2ENPlanWorkShort;

public class ENWorkOrder2ENPlanWorkShortList implements Serializable {

  /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
public int totalCount = 0;
  public Vector<ENWorkOrder2ENPlanWorkShort> list = new Vector<ENWorkOrder2ENPlanWorkShort>();

  public final int getTotalCount() {return totalCount;}
  public final void setTotalCount(int aValue) {totalCount = aValue;}

  public final Vector<ENWorkOrder2ENPlanWorkShort> getList() {return list;}
  public final void setList(Vector<ENWorkOrder2ENPlanWorkShort> aValue) {list = aValue;}

  public final com.ksoe.energynet.valueobject.brief.ENWorkOrder2ENPlanWorkShort get(int anIndex)
  {
    return list.get(anIndex);
  }

  public final int size()
  {
    return (list == null)?0:list.size();
  }

} // end of List for ENWorkOrder2ENPlanWork


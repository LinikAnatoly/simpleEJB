
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENPlanWorkItem2PlanWorkItem;  	
  */

import java.io.Serializable;
import java.util.Vector;

public class ENPlanWorkItem2PlanWorkItemShortList implements Serializable {

  public int totalCount = 0;
  public Vector list = new Vector();

  public final int getTotalCount() {return totalCount;}
  public final void setTotalCount(int aValue) {totalCount = aValue;}

  public final Vector getList() {return list;}
  public final void setList(Vector aValue) {list = aValue;}

  public final com.ksoe.energynet.valueobject.brief.ENPlanWorkItem2PlanWorkItemShort get(int anIndex)
  {
    return (com.ksoe.energynet.valueobject.brief.ENPlanWorkItem2PlanWorkItemShort)list.get(anIndex);
  }

  public final int size()
  {
    return (list == null)?0:list.size();
  }

} // end of List for ENPlanWorkItem2PlanWorkItem


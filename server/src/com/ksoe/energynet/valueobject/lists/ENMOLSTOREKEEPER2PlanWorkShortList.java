
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2014 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENMOLSTOREKEEPER2PlanWork;  	
  */

import java.util.Vector;
import java.io.Serializable;

public class ENMOLSTOREKEEPER2PlanWorkShortList implements Serializable {

  public int totalCount = 0;
  public Vector list = new Vector();

  public final int getTotalCount() {return totalCount;}
  public final void setTotalCount(int aValue) {totalCount = aValue;}

  public final Vector getList() {return list;}
  public final void setList(Vector aValue) {list = aValue;}

  public final com.ksoe.energynet.valueobject.brief.ENMOLSTOREKEEPER2PlanWorkShort get(int anIndex)
  {
    return (com.ksoe.energynet.valueobject.brief.ENMOLSTOREKEEPER2PlanWorkShort)list.get(anIndex);
  }

  public final int size()
  {
    return (list == null)?0:list.size();
  }

} // end of List for ENMOLSTOREKEEPER2PlanWork

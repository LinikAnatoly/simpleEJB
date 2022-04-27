
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for workerListFromKadry;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.workerListFromKadryShort;

public class workerListFromKadryShortList implements Serializable {

  public int totalCount = 0;
  public Vector<workerListFromKadryShort> list = new Vector<workerListFromKadryShort>();

  public final int getTotalCount() {return totalCount;}
  public final void setTotalCount(int aValue) {totalCount = aValue;}

  public final Vector getList() {return list;}
  public final void setList(Vector aValue) {list = aValue;}

  public final com.ksoe.energynet.valueobject.brief.workerListFromKadryShort get(int anIndex)
  {
    return (com.ksoe.energynet.valueobject.brief.workerListFromKadryShort)list.get(anIndex);
  }

  public final int size()
  {
    return (list == null)?0:list.size();
  }

} // end of List for workerListFromKadry


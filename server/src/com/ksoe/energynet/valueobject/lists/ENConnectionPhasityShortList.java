
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2013 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENConnectionPhasity;  	
  */

import java.util.Vector;
import java.io.Serializable;

public class ENConnectionPhasityShortList implements Serializable {

  public int totalCount = 0;
  public Vector list = new Vector();

  public final int getTotalCount() {return totalCount;}
  public final void setTotalCount(int aValue) {totalCount = aValue;}

  public final Vector getList() {return list;}
  public final void setList(Vector aValue) {list = aValue;}

  public final com.ksoe.energynet.valueobject.brief.ENConnectionPhasityShort get(int anIndex)
  {
    return (com.ksoe.energynet.valueobject.brief.ENConnectionPhasityShort)list.get(anIndex);
  }

  public final int size()
  {
    return (list == null)?0:list.size();
  }

} // end of List for ENConnectionPhasity


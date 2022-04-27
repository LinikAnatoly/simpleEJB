
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENChangePersonByt;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENChangePersonBytShort;

public class ENChangePersonBytShortList implements Serializable {

  public int totalCount = 0;
  public Vector<ENChangePersonBytShort> list = new Vector<ENChangePersonBytShort>();

  public final int getTotalCount() {return totalCount;}
  public final void setTotalCount(int aValue) {totalCount = aValue;}

  public final Vector getList() {return list;}
  public final void setList(Vector aValue) {list = aValue;}

  public final com.ksoe.energynet.valueobject.brief.ENChangePersonBytShort get(int anIndex)
  {
    return (com.ksoe.energynet.valueobject.brief.ENChangePersonBytShort)list.get(anIndex);
  }

  public final int size()
  {
    return (list == null)?0:list.size();
  }

} // end of List for ENChangePersonByt


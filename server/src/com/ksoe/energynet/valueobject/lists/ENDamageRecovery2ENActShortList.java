
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for ENDamageRecovery2ENAct;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.ENDamageRecovery2ENActShort;

public class ENDamageRecovery2ENActShortList implements Serializable {

  public int totalCount = 0;
  public Vector<ENDamageRecovery2ENActShort> list = new Vector<ENDamageRecovery2ENActShort>();

  public final int getTotalCount() {return totalCount;}
  public final void setTotalCount(int aValue) {totalCount = aValue;}

  public final Vector getList() {return list;}
  public final void setList(Vector aValue) {list = aValue;}

  public final com.ksoe.energynet.valueobject.brief.ENDamageRecovery2ENActShort get(int anIndex)
  {
    return (com.ksoe.energynet.valueobject.brief.ENDamageRecovery2ENActShort)list.get(anIndex);
  }

  public final int size()
  {
    return (list == null)?0:list.size();
  }

} // end of List for ENDamageRecovery2ENAct


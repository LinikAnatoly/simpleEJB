
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.lists;


  /**
  * Short List for FINExecutor;  	
  */

import java.util.Vector;
import java.io.Serializable;
import com.ksoe.energynet.valueobject.brief.FINExecutorShort;

public class FINExecutorShortList implements Serializable {

  /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
public int totalCount = 0;
  public Vector<FINExecutorShort> list = new Vector<FINExecutorShort>();

  public final int getTotalCount() {return totalCount;}
  public final void setTotalCount(int aValue) {totalCount = aValue;}

  public final Vector<FINExecutorShort> getList() {return list;}
  public final void setList(Vector<FINExecutorShort> aValue) {list = aValue;}

  public final com.ksoe.energynet.valueobject.brief.FINExecutorShort get(int anIndex)
  {
    return (com.ksoe.energynet.valueobject.brief.FINExecutorShort)list.get(anIndex);
  }

  public final int size()
  {
    return (list == null)?0:list.size();
  }

} // end of List for FINExecutor


package com.ksoe.energynet.valueobject.lists;

import java.io.Serializable;
import java.util.Vector;

import com.ksoe.energynet.valueobject.brief.SCCounterDataShort;

public class SCCounterDataShortList implements Serializable
{
	  /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public int totalCount = 0;
	  public Vector<SCCounterDataShort> list = new Vector<SCCounterDataShort>();

	  public final int getTotalCount() {return totalCount;}
	  public final void setTotalCount(int aValue) {totalCount = aValue;}

	  public final Vector<SCCounterDataShort> getList() {return list;}
	  public final void setList(Vector<SCCounterDataShort> aValue) {list = aValue;}

	  public final com.ksoe.energynet.valueobject.brief.SCCounterDataShort get(int anIndex)
	  {
	    return (com.ksoe.energynet.valueobject.brief.SCCounterDataShort)list.get(anIndex);
	  }

	  public final int size()
	  {
	    return (list == null)?0:list.size();
	  }
}

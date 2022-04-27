package  com.ksoe.energynet.valueobject.lists;


import java.io.Serializable;
import java.util.Vector;

import com.ksoe.energynet.valueobject.brief.BufetOrderShort;

public class BufetOrderShortList implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
public int totalCount = 0;
  public Vector<BufetOrderShort> list = new Vector<BufetOrderShort>();

  public final int getTotalCount() {return totalCount;}
  public final void setTotalCount(int aValue) {totalCount = aValue;}

  public final Vector<BufetOrderShort> getList() {return list;}
  public final void setList(Vector<BufetOrderShort> aValue) {list = aValue;}
  
  
  public final BufetOrderShort get(int anIndex)
  {
    return list.get(anIndex);
  }

  public final int size()
  {
    return (list == null)?0:list.size();
  }
  
} 


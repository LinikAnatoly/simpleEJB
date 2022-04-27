
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.references;

  /**
  * References for FINMol;  	
  */

import java.io.Serializable;


public class FINMolRef implements Serializable
{
    public int id = Integer.MIN_VALUE; 

  public static final String className = "com.ksoe.energynet.valueobject.FINMol";

    public void setId(int aValue){
       id = aValue;
    }
    public int getId(){
       return id;
    }
	



} // end of FINMolRef


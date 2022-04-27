
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.references;

  /**
  * References for CNMovement;  	
  */

import java.io.Serializable;


public class CNMovementRef implements Serializable
{
    public int id = Integer.MIN_VALUE; 

  public static final String className = "com.ksoe.energynet.valueobject.CNMovement";

    public void setId(int aValue){
       id = aValue;
    }
    public int getId(){
       return id;
    }
	



} // end of CNMovementRef


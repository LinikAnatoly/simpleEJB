
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2018 SIT
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.references;

/**
* References for ENServicesObject;
*/

import java.io.Serializable;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;


@XmlRootElement(name = "ENServicesObjectRef")
@XmlAccessorType(XmlAccessType.FIELD)
public class ENServicesObjectRef implements Serializable {
	public int code = Integer.MIN_VALUE;

	public static final String className = "com.ksoe.energynet.valueobject.ENServicesObject";

	public void setCode(int aValue) {
		code = aValue;
	}

	public int getCode() {
		return code;
	}

} // end of ENServicesObjectRef

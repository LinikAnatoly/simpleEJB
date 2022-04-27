
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
// Generated at Fri Sep 18 11:06:01 EEST 2009
// Created with ModelJ - the RAD tool for J2EE
// http://modelj.sourceforge.net
//---------------------------------------------------------

package com.ksoe.energynet.valueobject.references;

/**
* References for ENElementType;
*/

import java.io.Serializable;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;


@XmlRootElement(name = "ENElementTypeRef")
@XmlAccessorType(XmlAccessType.FIELD)
public class ENElementTypeRef implements Serializable {
	public int code = Integer.MIN_VALUE;

	public static final String className = "com.ksoe.energynet.valueobject.ENElementType";

	public void setCode(int aValue) {
		code = aValue;
	}

	public int getCode() {
		return code;
	}

} // end of ENElementTypeRef

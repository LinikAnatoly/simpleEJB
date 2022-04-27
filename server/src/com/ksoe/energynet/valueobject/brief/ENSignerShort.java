
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENSigner;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENSignerShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public String signerPosition;
	public String signerFio;
	public String signatureImagePath;
	public String commentGen;


	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getSignerPosition() {
		return signerPosition;
	}

	public void setSignerPosition(String signerPosition) {
		this.signerPosition = signerPosition;
	}

	public String getSignerFio() {
		return signerFio;
	}

	public void setSignerFio(String signerFio) {
		this.signerFio = signerFio;
	}

	public String getSignatureImagePath() {
		return signatureImagePath;
	}

	public void setSignatureImagePath(String signatureImagePath) {
		this.signatureImagePath = signatureImagePath;
	}

	public String getCommentGen() {
		return commentGen;
	}

	public void setCommentGen(String commentGen) {
		this.commentGen = commentGen;
	}




}

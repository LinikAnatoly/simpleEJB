
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENDistributionAgree;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENDistributionAgreeShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public String numberGen;
	public Date dateGen ;
	public String eic;
	public String objectname;
	public String objectaddress;
	public BigDecimal power;
	public String d2fusename;
	public String d3countername;
	public String d3countertype;
	public BigDecimal d3amperageratio;
	public BigDecimal d3voltageratio;
	public BigDecimal d3totalratio;
	public String d3place;
	public String d3voltageclass;
	public String d3workmode;
	public String d3tarifftype;
	public String d3accountingtype;
	public String d5feederlist;
	public String d6reliabilitypue;
	public String d6reliabilityguaranteed;
	public String d6balancesupplier;
	public String d6balanceclient;
	public String d6responsibilitysupplier;
	public String d6responsibilityclient;
	public String d6balancelimit;
	public String d7linesource;
	public String d7attachment;
	public String d8conditions;
	public String d8transformertype;
	public BigDecimal d8voltagebh;
	public BigDecimal d8voltagehh;
	public BigDecimal d8lossesxx;
	public BigDecimal d8losseskz;
	public BigDecimal d8amperage;
	public BigDecimal d8voltagekz;
	public BigDecimal d8linelength;
	public BigDecimal d8liner;
	public BigDecimal d8linex;
	public int d8hours = Integer.MIN_VALUE;
	public String userGen;
	public int warrantRefCode = Integer.MIN_VALUE;
	public String warrantRefNumbergen;
	public String warrantRefName;
	public String warrantRefWarrantFIO;
	public String warrantRefWarrantShortFIO;
	public String warrantRefWarrantPosition;
	public String warrantRefGenitiveFIO;
	public String warrantRefGenitivePosition;
	public String warrantRefPassport;
	public String warrantRefAddress;
	public int warrantRefPower = Integer.MIN_VALUE;
	public BigDecimal warrantRefMaxSum;


	public void setCode(int aValue){
		code = aValue;
	}

	public int getCode(){
		return code;
	}

	public void setNumberGen(String aValue){
		numberGen = aValue;
	}

	public String getNumberGen(){
		return numberGen;
	}

	public void setDateGen(Date aValue){
		dateGen = aValue;
	}

	public Date getDateGen(){
		return dateGen;
	}

	public void setEic(String aValue){
		eic = aValue;
	}

	public String getEic(){
		return eic;
	}

	public void setObjectname(String aValue){
		objectname = aValue;
	}

	public String getObjectname(){
		return objectname;
	}

	public void setObjectaddress(String aValue){
		objectaddress = aValue;
	}

	public String getObjectaddress(){
		return objectaddress;
	}

	public void setPower(BigDecimal aValue){
		power = aValue;
	}

	public BigDecimal getPower(){
		return power;
	}

	public void setD2fusename(String aValue){
		d2fusename = aValue;
	}

	public String getD2fusename(){
		return d2fusename;
	}

	public void setD3countername(String aValue){
		d3countername = aValue;
	}

	public String getD3countername(){
		return d3countername;
	}

	public void setD3countertype(String aValue){
		d3countertype = aValue;
	}

	public String getD3countertype(){
		return d3countertype;
	}

	public void setD3amperageratio(BigDecimal aValue){
		d3amperageratio = aValue;
	}

	public BigDecimal getD3amperageratio(){
		return d3amperageratio;
	}

	public void setD3voltageratio(BigDecimal aValue){
		d3voltageratio = aValue;
	}

	public BigDecimal getD3voltageratio(){
		return d3voltageratio;
	}

	public void setD3totalratio(BigDecimal aValue){
		d3totalratio = aValue;
	}

	public BigDecimal getD3totalratio(){
		return d3totalratio;
	}

	public void setD3place(String aValue){
		d3place = aValue;
	}

	public String getD3place(){
		return d3place;
	}

	public void setD3voltageclass(String aValue){
		d3voltageclass = aValue;
	}

	public String getD3voltageclass(){
		return d3voltageclass;
	}

	public void setD3workmode(String aValue){
		d3workmode = aValue;
	}

	public String getD3workmode(){
		return d3workmode;
	}

	public void setD3tarifftype(String aValue){
		d3tarifftype = aValue;
	}

	public String getD3tarifftype(){
		return d3tarifftype;
	}

	public void setD3accountingtype(String aValue){
		d3accountingtype = aValue;
	}

	public String getD3accountingtype(){
		return d3accountingtype;
	}

	public void setD5feederlist(String aValue){
		d5feederlist = aValue;
	}

	public String getD5feederlist(){
		return d5feederlist;
	}

	public void setD6reliabilitypue(String aValue){
		d6reliabilitypue = aValue;
	}

	public String getD6reliabilitypue(){
		return d6reliabilitypue;
	}

	public void setD6reliabilityguaranteed(String aValue){
		d6reliabilityguaranteed = aValue;
	}

	public String getD6reliabilityguaranteed(){
		return d6reliabilityguaranteed;
	}

	public void setD6balancesupplier(String aValue){
		d6balancesupplier = aValue;
	}

	public String getD6balancesupplier(){
		return d6balancesupplier;
	}

	public void setD6balanceclient(String aValue){
		d6balanceclient = aValue;
	}

	public String getD6balanceclient(){
		return d6balanceclient;
	}

	public void setD6responsibilitysupplier(String aValue){
		d6responsibilitysupplier = aValue;
	}

	public String getD6responsibilitysupplier(){
		return d6responsibilitysupplier;
	}

	public void setD6responsibilityclient(String aValue){
		d6responsibilityclient = aValue;
	}

	public String getD6responsibilityclient(){
		return d6responsibilityclient;
	}

	public void setD6balancelimit(String aValue){
		d6balancelimit = aValue;
	}

	public String getD6balancelimit(){
		return d6balancelimit;
	}

	public void setD7linesource(String aValue){
		d7linesource = aValue;
	}

	public String getD7linesource(){
		return d7linesource;
	}

	public void setD7attachment(String aValue){
		d7attachment = aValue;
	}

	public String getD7attachment(){
		return d7attachment;
	}

	public void setD8conditions(String aValue){
		d8conditions = aValue;
	}

	public String getD8conditions(){
		return d8conditions;
	}

	public void setD8transformertype(String aValue){
		d8transformertype = aValue;
	}

	public String getD8transformertype(){
		return d8transformertype;
	}

	public void setD8voltagebh(BigDecimal aValue){
		d8voltagebh = aValue;
	}

	public BigDecimal getD8voltagebh(){
		return d8voltagebh;
	}

	public void setD8voltagehh(BigDecimal aValue){
		d8voltagehh = aValue;
	}

	public BigDecimal getD8voltagehh(){
		return d8voltagehh;
	}

	public void setD8lossesxx(BigDecimal aValue){
		d8lossesxx = aValue;
	}

	public BigDecimal getD8lossesxx(){
		return d8lossesxx;
	}

	public void setD8losseskz(BigDecimal aValue){
		d8losseskz = aValue;
	}

	public BigDecimal getD8losseskz(){
		return d8losseskz;
	}

	public void setD8amperage(BigDecimal aValue){
		d8amperage = aValue;
	}

	public BigDecimal getD8amperage(){
		return d8amperage;
	}

	public void setD8voltagekz(BigDecimal aValue){
		d8voltagekz = aValue;
	}

	public BigDecimal getD8voltagekz(){
		return d8voltagekz;
	}

	public void setD8linelength(BigDecimal aValue){
		d8linelength = aValue;
	}

	public BigDecimal getD8linelength(){
		return d8linelength;
	}

	public void setD8liner(BigDecimal aValue){
		d8liner = aValue;
	}

	public BigDecimal getD8liner(){
		return d8liner;
	}

	public void setD8linex(BigDecimal aValue){
		d8linex = aValue;
	}

	public BigDecimal getD8linex(){
		return d8linex;
	}

	public void setD8hours(int aValue){
		d8hours = aValue;
	}

	public int getD8hours(){
		return d8hours;
	}

	public void setUserGen(String aValue){
		userGen = aValue;
	}

	public String getUserGen(){
		return userGen;
	}



	public void setWarrantRefCode(int aValue){
		warrantRefCode = aValue;
	}
	public int getWarrantRefCode(){
		return warrantRefCode;
	}

	public void setWarrantRefNumbergen(String aValue){
		warrantRefNumbergen = aValue;
	}
	public String getWarrantRefNumbergen(){
		return warrantRefNumbergen;
	}

	public void setWarrantRefName(String aValue){
		warrantRefName = aValue;
	}
	public String getWarrantRefName(){
		return warrantRefName;
	}

	public void setWarrantRefWarrantFIO(String aValue){
		warrantRefWarrantFIO = aValue;
	}
	public String getWarrantRefWarrantFIO(){
		return warrantRefWarrantFIO;
	}

	public void setWarrantRefWarrantShortFIO(String aValue){
		warrantRefWarrantShortFIO = aValue;
	}
	public String getWarrantRefWarrantShortFIO(){
		return warrantRefWarrantShortFIO;
	}

	public void setWarrantRefWarrantPosition(String aValue){
		warrantRefWarrantPosition = aValue;
	}
	public String getWarrantRefWarrantPosition(){
		return warrantRefWarrantPosition;
	}

	public void setWarrantRefGenitiveFIO(String aValue){
		warrantRefGenitiveFIO = aValue;
	}
	public String getWarrantRefGenitiveFIO(){
		return warrantRefGenitiveFIO;
	}

	public void setWarrantRefGenitivePosition(String aValue){
		warrantRefGenitivePosition = aValue;
	}
	public String getWarrantRefGenitivePosition(){
		return warrantRefGenitivePosition;
	}

	public void setWarrantRefPassport(String aValue){
		warrantRefPassport = aValue;
	}
	public String getWarrantRefPassport(){
		return warrantRefPassport;
	}

	public void setWarrantRefAddress(String aValue){
		warrantRefAddress = aValue;
	}
	public String getWarrantRefAddress(){
		return warrantRefAddress;
	}

	public void setWarrantRefPower(int aValue){
		warrantRefPower = aValue;
	}
	public int getWarrantRefPower(){
		return warrantRefPower;
	}

	public void setWarrantRefMaxSum(BigDecimal aValue){
		warrantRefMaxSum = aValue;
	}
	public BigDecimal getWarrantRefMaxSum(){
		return warrantRefMaxSum;
	}



}

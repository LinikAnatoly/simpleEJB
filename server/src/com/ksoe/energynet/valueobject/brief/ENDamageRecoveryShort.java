
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENDamageRecovery;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENDamageRecoveryShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public String numberGen;
    public Date dateGen ;
    public String FKcontractCode;
    public String FKpartnerCode;
    public String FKdocCode;
    public int FKdocID = Integer.MIN_VALUE;
    public String commentGen;
    public String contragentName;
    public String contragentAddress;
    public String contragentPassport;
    public BigDecimal damageAmmount;
    public int partId = Integer.MIN_VALUE;
    public Date datePosting ;
    public String userGen;
    public Date dateEdit ;
    public int departmentCode = Integer.MIN_VALUE;
    public String departmentShortName;
    public Date departmentDateStart;
    public Date departmentDateFinal;
    public int departmentRenCode = Integer.MIN_VALUE;
    public String departmentShpzBalans;
    public int departmentKau_table_id_1884 = Integer.MIN_VALUE;
    public String departmentKau_1884;
    public String departmentName_1884;
    public int statusRefCode = Integer.MIN_VALUE;
    public String statusRefName;
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
    public void setFKcontractCode(String aValue){
       FKcontractCode = aValue;
    }

    public String getFKcontractCode(){
       return FKcontractCode;
    }
    public void setFKpartnerCode(String aValue){
       FKpartnerCode = aValue;
    }

    public String getFKpartnerCode(){
       return FKpartnerCode;
    }
    public void setFKdocCode(String aValue){
       FKdocCode = aValue;
    }

    public String getFKdocCode(){
       return FKdocCode;
    }
    public void setFKdocID(int aValue){
       FKdocID = aValue;
    }

    public int getFKdocID(){
       return FKdocID;
    }
    public void setCommentGen(String aValue){
       commentGen = aValue;
    }

    public String getCommentGen(){
       return commentGen;
    }
    public void setContragentName(String aValue){
       contragentName = aValue;
    }

    public String getContragentName(){
       return contragentName;
    }
    public void setContragentAddress(String aValue){
       contragentAddress = aValue;
    }

    public String getContragentAddress(){
       return contragentAddress;
    }
    public void setContragentPassport(String aValue){
       contragentPassport = aValue;
    }

    public String getContragentPassport(){
       return contragentPassport;
    }
    public void setDamageAmmount(BigDecimal aValue){
       damageAmmount = aValue;
    }

    public BigDecimal getDamageAmmount(){
       return damageAmmount;
    }
    public void setPartId(int aValue){
       partId = aValue;
    }

    public int getPartId(){
       return partId;
    }

    public void setDatePosting(Date aValue){
       datePosting = aValue;
    }

    public Date getDatePosting(){
       return datePosting;
    }
    public void setUserGen(String aValue){
       userGen = aValue;
    }

    public String getUserGen(){
       return userGen;
    }

    public void setDateEdit(Date aValue){
       dateEdit = aValue;
    }

    public Date getDateEdit(){
       return dateEdit;
    }


    public void setDepartmentCode(int aValue){
       departmentCode = aValue;
    }
    public int getDepartmentCode(){
       return departmentCode;
    }

    public void setDepartmentShortName(String aValue){
       departmentShortName = aValue;
    }
    public String getDepartmentShortName(){
       return departmentShortName;
    }


    public void setDepartmentDateStart(Date aValue){
       departmentDateStart = aValue;
    }
    public Date getDepartmentDateStart(){
       return departmentDateStart;
    }


    public void setDepartmentDateFinal(Date aValue){
       departmentDateFinal = aValue;
    }
    public Date getDepartmentDateFinal(){
       return departmentDateFinal;
    }

    public void setDepartmentRenCode(int aValue){
       departmentRenCode = aValue;
    }
    public int getDepartmentRenCode(){
       return departmentRenCode;
    }

    public void setDepartmentShpzBalans(String aValue){
       departmentShpzBalans = aValue;
    }
    public String getDepartmentShpzBalans(){
       return departmentShpzBalans;
    }

    public void setDepartmentKau_table_id_1884(int aValue){
       departmentKau_table_id_1884 = aValue;
    }
    public int getDepartmentKau_table_id_1884(){
       return departmentKau_table_id_1884;
    }

    public void setDepartmentKau_1884(String aValue){
       departmentKau_1884 = aValue;
    }
    public String getDepartmentKau_1884(){
       return departmentKau_1884;
    }

    public void setDepartmentName_1884(String aValue){
       departmentName_1884 = aValue;
    }
    public String getDepartmentName_1884(){
       return departmentName_1884;
    }

    public void setStatusRefCode(int aValue){
       statusRefCode = aValue;
    }
    public int getStatusRefCode(){
       return statusRefCode;
    }

    public void setStatusRefName(String aValue){
       statusRefName = aValue;
    }
    public String getStatusRefName(){
       return statusRefName;
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
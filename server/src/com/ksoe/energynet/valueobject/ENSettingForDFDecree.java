
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENSettingForDFDecree;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENDepartmentRef;
    import  com.ksoe.energynet.valueobject.references.ENWarrantRef;

public class ENSettingForDFDecree implements Serializable {

    public int  code = Integer.MIN_VALUE;
    public int  dfDocTypeCode = Integer.MIN_VALUE;
    public String  dfDocTypeName; 
    public int  catalogCode = Integer.MIN_VALUE;
    public String  catalogName; 
    public int  dfDocPrefixCode = Integer.MIN_VALUE;
    public String  dfDocPrefixName; 
    public String  prefixSignerTabN; 
    public String  prefixSignerFio; 
    public String  prefixSignerPostInfo; 
    public String  initiatorTabn; 
    public String  initiatorFio; 
    public String  initiatorPodrName; 
    public int  initiatorPodrCode = Integer.MIN_VALUE;
    public String  designatedTabn; 
    public String  designatedFio; 
    public String  designatedpostInfo; 
    public ENDepartmentRef departmentRef = new ENDepartmentRef();
    public ENWarrantRef responsRef = new ENWarrantRef();
    public static final String tableName = "ENSETTINGFORDFDECREE";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENSETTINGFORDFDECREE.CODE";
    public static final String dfDocTypeCode_Attr = "dfDocTypeCode";
    public static final String dfDocTypeCode_Field = "DFDOCTYPECODE";
    public static final String dfDocTypeCode_QFielld = "ENSETTINGFORDFDECREE.DFDOCTYPECODE";
    public static final String dfDocTypeName_Attr = "dfDocTypeName";
    public static final String dfDocTypeName_Field = "DFDOCTYPENAME";
    public static final String dfDocTypeName_QFielld = "ENSETTINGFORDFDECREE.DFDOCTYPENAME";
    public static final String catalogCode_Attr = "catalogCode";
    public static final String catalogCode_Field = "CATALOGCODE";
    public static final String catalogCode_QFielld = "ENSETTINGFORDFDECREE.CATALOGCODE";
    public static final String catalogName_Attr = "catalogName";
    public static final String catalogName_Field = "CATALOGNAME";
    public static final String catalogName_QFielld = "ENSETTINGFORDFDECREE.CATALOGNAME";
    public static final String dfDocPrefixCode_Attr = "dfDocPrefixCode";
    public static final String dfDocPrefixCode_Field = "DFDOCPREFIXCODE";
    public static final String dfDocPrefixCode_QFielld = "ENSETTINGFORDFDECREE.DFDOCPREFIXCODE";
    public static final String dfDocPrefixName_Attr = "dfDocPrefixName";
    public static final String dfDocPrefixName_Field = "DFDOCPREFIXNAME";
    public static final String dfDocPrefixName_QFielld = "ENSETTINGFORDFDECREE.DFDOCPREFIXNAME";
    public static final String prefixSignerTabN_Attr = "prefixSignerTabN";
    public static final String prefixSignerTabN_Field = "PREFIXSIGNERTABN";
    public static final String prefixSignerTabN_QFielld = "ENSETTINGFORDFDECREE.PREFIXSIGNERTABN";
    public static final String prefixSignerFio_Attr = "prefixSignerFio";
    public static final String prefixSignerFio_Field = "PREFIXSIGNERFIO";
    public static final String prefixSignerFio_QFielld = "ENSETTINGFORDFDECREE.PREFIXSIGNERFIO";
    public static final String prefixSignerPostInfo_Attr = "prefixSignerPostInfo";
    public static final String prefixSignerPostInfo_Field = "PREFIXSIGNERPOSTINFO";
    public static final String prefixSignerPostInfo_QFielld = "ENSETTINGFORDFDECREE.PREFIXSIGNERPOSTINFO";
    public static final String initiatorTabn_Attr = "initiatorTabn";
    public static final String initiatorTabn_Field = "INITIATORTABN";
    public static final String initiatorTabn_QFielld = "ENSETTINGFORDFDECREE.INITIATORTABN";
    public static final String initiatorFio_Attr = "initiatorFio";
    public static final String initiatorFio_Field = "INITIATORFIO";
    public static final String initiatorFio_QFielld = "ENSETTINGFORDFDECREE.INITIATORFIO";
    public static final String initiatorPodrName_Attr = "initiatorPodrName";
    public static final String initiatorPodrName_Field = "INITIATORPODRNAME";
    public static final String initiatorPodrName_QFielld = "ENSETTINGFORDFDECREE.INITIATORPODRNAME";
    public static final String initiatorPodrCode_Attr = "initiatorPodrCode";
    public static final String initiatorPodrCode_Field = "INITIATORPODRCODE";
    public static final String initiatorPodrCode_QFielld = "ENSETTINGFORDFDECREE.INITIATORPODRCODE";
    public static final String designatedTabn_Attr = "designatedTabn";
    public static final String designatedTabn_Field = "DESIGNATEDTABN";
    public static final String designatedTabn_QFielld = "ENSETTINGFORDFDECREE.DESIGNATEDTABN";
    public static final String designatedFio_Attr = "designatedFio";
    public static final String designatedFio_Field = "DESIGNATEDFIO";
    public static final String designatedFio_QFielld = "ENSETTINGFORDFDECREE.DESIGNATEDFIO";
    public static final String designatedpostInfo_Attr = "designatedpostInfo";
    public static final String designatedpostInfo_Field = "DESIGNATEDPOSTINFO";
    public static final String designatedpostInfo_QFielld = "ENSETTINGFORDFDECREE.DESIGNATEDPOSTINFO";
    public static final String departmentRef_Attr = "departmentRef";
    public static final String departmentRef_Field = "DEPARTMENTREFCODE";
    public static final String  departmentRef_QFielld = "ENSETTINGFORDFDECREE.DEPARTMENTREFCODE";
    public static final String responsRef_Attr = "responsRef";
    public static final String responsRef_Field = "RESPONSREFCODE";
    public static final String  responsRef_QFielld = "ENSETTINGFORDFDECREE.RESPONSREFCODE";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setDfDocTypeCode(int aValue){
       dfDocTypeCode = aValue;
    }

    public int getDfDocTypeCode(){
       return dfDocTypeCode;
    }


    public void setDfDocTypeName(String aValue){
       dfDocTypeName = aValue;
    }

    public String getDfDocTypeName(){
       return dfDocTypeName;
    }


    public void setCatalogCode(int aValue){
       catalogCode = aValue;
    }

    public int getCatalogCode(){
       return catalogCode;
    }


    public void setCatalogName(String aValue){
       catalogName = aValue;
    }

    public String getCatalogName(){
       return catalogName;
    }


    public void setDfDocPrefixCode(int aValue){
       dfDocPrefixCode = aValue;
    }

    public int getDfDocPrefixCode(){
       return dfDocPrefixCode;
    }


    public void setDfDocPrefixName(String aValue){
       dfDocPrefixName = aValue;
    }

    public String getDfDocPrefixName(){
       return dfDocPrefixName;
    }


    public void setPrefixSignerTabN(String aValue){
       prefixSignerTabN = aValue;
    }

    public String getPrefixSignerTabN(){
       return prefixSignerTabN;
    }


    public void setPrefixSignerFio(String aValue){
       prefixSignerFio = aValue;
    }

    public String getPrefixSignerFio(){
       return prefixSignerFio;
    }


    public void setPrefixSignerPostInfo(String aValue){
       prefixSignerPostInfo = aValue;
    }

    public String getPrefixSignerPostInfo(){
       return prefixSignerPostInfo;
    }


    public void setInitiatorTabn(String aValue){
       initiatorTabn = aValue;
    }

    public String getInitiatorTabn(){
       return initiatorTabn;
    }


    public void setInitiatorFio(String aValue){
       initiatorFio = aValue;
    }

    public String getInitiatorFio(){
       return initiatorFio;
    }


    public void setInitiatorPodrName(String aValue){
       initiatorPodrName = aValue;
    }

    public String getInitiatorPodrName(){
       return initiatorPodrName;
    }


    public void setInitiatorPodrCode(int aValue){
       initiatorPodrCode = aValue;
    }

    public int getInitiatorPodrCode(){
       return initiatorPodrCode;
    }


    public void setDesignatedTabn(String aValue){
       designatedTabn = aValue;
    }

    public String getDesignatedTabn(){
       return designatedTabn;
    }


    public void setDesignatedFio(String aValue){
       designatedFio = aValue;
    }

    public String getDesignatedFio(){
       return designatedFio;
    }


    public void setDesignatedpostInfo(String aValue){
       designatedpostInfo = aValue;
    }

    public String getDesignatedpostInfo(){
       return designatedpostInfo;
    }

    public void setDepartmentRef(ENDepartmentRef aValue){
       departmentRef = aValue;
    }

    public ENDepartmentRef getDepartmentRef(){
       return departmentRef;
    }
    public void setResponsRef(ENWarrantRef aValue){
       responsRef = aValue;
    }

    public ENWarrantRef getResponsRef(){
       return responsRef;
    }

} // end of ENSettingForDFDecreeValueObject


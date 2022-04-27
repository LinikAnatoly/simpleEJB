
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENDepartment;
  */

import java.io.Serializable;
import java.util.Date;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;

import com.ksoe.energynet.valueobject.references.ENDepartmentRef;
import com.ksoe.energynet.valueobject.references.ENDepartmentTypeRef;
import com.ksoe.energynet.valueobject.references.ENManagementRef;


@XmlRootElement(name = "ENDepartment")
@XmlAccessorType(XmlAccessType.FIELD)
public class ENDepartment implements Serializable {

    public static final int HMVE = 482;
    public static final int NKAHVE = 500000044;

    /** категории РЭС (1-4) */
    public static final int I_CATEGORY = 1;
    public static final int II_CATEGORY = 2;
    public static final int III_CATEGORY = 3;
    public static final int IV_CATEGORY = 4;

    /** РЭСы 1-й категории:
     *  ХМЕМ, ХМВЕ
     */
    public static final int[] REN_I_CATEGORY = {481, 482};

    /** РЭСы 2-й категории:
     *  Н.Каховка, Каховка, Олешки, Новокаховське МВКО
     */
    public static final int[] REN_II_CATEGORY = {11, 17, 480, 500000044};

    /** РЭСы 3-й категории:
     *  Генічеськ, Скадовськ, Гола Пристань
     */
    public static final int[] REN_III_CATEGORY = {8, 10, 14};

    /** РЭСы 4-й категории:
     *  Берислав, В.Олександрівка, В.Лепетиха, Високопілля, Нововоронцовка, Новотроїцьк, Чаплинка, Іванівка
     */
    public static final int[] REN_IV_CATEGORY = {5, 6, 7, 9, 12, 18, 478, 479};

    public static final int ENDEPARTMENT_CENTRAL_WAREHOUSE = 49;
    public static final int ENDEPARTMENT_REM = 731; // код РЕМи
    public static final int ENDEPARTMENT_HOE = 1;
    public static final int DISTRIBUTION_NETWORK_CENTER = 500001294;

    /** ПАТ ЕК "Херсонобленерго" */
    public static final int ENDEPARTMENT_KSOE = 500000019;

    /** ДЕПАРТАМЕНТ З РОЗПОДІЛЬНИХ МЕРЕЖ */
    public static final int ENDEPARTMENT_DISTRIBUTION_NETWORKS = 500000052;
    public static final int ENDEPARTMENT_OF_CLIENT_OPERATIONS = 500000053;

    public int  code = Integer.MIN_VALUE;
    public String  name;
    public String  shortName;
    public int  isVirtual = Integer.MIN_VALUE;
    public Date dateStart ;
    public Date dateFinal ;
    public int  renCode = Integer.MIN_VALUE;
    public String  shpzBalans;
    public int  shpzFinId = Integer.MIN_VALUE;
    public int  kau_table_id_1884 = Integer.MIN_VALUE;
    public String  kau_1884;
    public String  name_1884;
    public String  hrmorganizationid;
    public String  domain_info;
    public long  modify_time = Long.MIN_VALUE;

    public ENDepartmentRef parentRef = new ENDepartmentRef();
    public ENDepartmentTypeRef typeRef = new ENDepartmentTypeRef();
    public ENManagementRef managementRef = new ENManagementRef();

    public static final String tableName = "ENDEPARTMENT";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENDEPARTMENT.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENDEPARTMENT.NAME";
    public static final String shortName_Attr = "shortName";
    public static final String shortName_Field = "SHORTNAME";
    public static final String shortName_QFielld = "ENDEPARTMENT.SHORTNAME";
    public static final String isVirtual_Attr = "isVirtual";
    public static final String isVirtual_Field = "ISVIRTUAL";
    public static final String isVirtual_QFielld = "ENDEPARTMENT.ISVIRTUAL";
    public static final String dateStart_Attr = "dateStart";
    public static final String dateStart_Field = "DATESTART";
    public static final String dateStart_QFielld = "ENDEPARTMENT.DATESTART";
    public static final String dateFinal_Attr = "dateFinal";
    public static final String dateFinal_Field = "DATEFINAL";
    public static final String dateFinal_QFielld = "ENDEPARTMENT.DATEFINAL";
    public static final String renCode_Attr = "renCode";
    public static final String renCode_Field = "RENCODE";
    public static final String renCode_QFielld = "ENDEPARTMENT.RENCODE";
    public static final String shpzBalans_Attr = "shpzBalans";
    public static final String shpzBalans_Field = "SHPZBALANS";
    public static final String shpzBalans_QFielld = "ENDEPARTMENT.SHPZBALANS";
    public static final String shpzFinId_Attr = "shpzFinId";
    public static final String shpzFinId_Field = "SHPZFINID";
    public static final String shpzFinId_QFielld = "ENDEPARTMENT.SHPZFINID";
    public static final String kau_table_id_1884_Attr = "kau_table_id_1884";
    public static final String kau_table_id_1884_Field = "KAU_TABLE_ID_1884";
    public static final String kau_table_id_1884_QFielld = "ENDEPARTMENT.KAU_TABLE_ID_1884";
    public static final String kau_1884_Attr = "kau_1884";
    public static final String kau_1884_Field = "KAU_1884";
    public static final String kau_1884_QFielld = "ENDEPARTMENT.KAU_1884";
    public static final String name_1884_Attr = "name_1884";
    public static final String name_1884_Field = "NAME_1884";
    public static final String name_1884_QFielld = "ENDEPARTMENT.NAME_1884";
    public static final String hrmorganizationid_Attr = "hrmorganizationid";
    public static final String hrmorganizationid_Field = "HRMORGANIZATIONID";
    public static final String hrmorganizationid_QFielld = "ENDEPARTMENT.HRMORGANIZATIONID";
    public static final String domain_info_Attr = "domain_info";
    public static final String domain_info_Field = "DOMAIN_INFO";
    public static final String domain_info_QFielld = "ENDEPARTMENT.DOMAIN_INFO";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENDEPARTMENT.MODIFY_TIME";
    public static final String parentRef_Attr = "parentRef";
    public static final String parentRef_Field = "PARENTREFCODE";
    public static final String  parentRef_QFielld = "ENDEPARTMENT.PARENTREFCODE";
    public static final String typeRef_Attr = "typeRef";
    public static final String typeRef_Field = "TYPEREFCODE";
    public static final String  typeRef_QFielld = "ENDEPARTMENT.TYPEREFCODE";
    public static final String managementRef_Attr = "managementRef";
    public static final String managementRef_Field = "MANAGEMENTREFCODE";
    public static final String  managementRef_QFielld = "ENDEPARTMENT.MANAGEMENTREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setName(String aValue){
       name = aValue;
    }

    public String getName(){
       return name;
    }

    public void setShortName(String aValue){
       shortName = aValue;
    }

    public String getShortName(){
       return shortName;
    }

    public void setIsVirtual(int aValue){
       isVirtual = aValue;
    }

    public int getIsVirtual(){
       return isVirtual;
    }


    public void setDateStart(Date aValue){
       dateStart = aValue;
    }

    public Date getDateStart(){
       return dateStart;
    }


    public void setDateFinal(Date aValue){
       dateFinal = aValue;
    }

    public Date getDateFinal(){
       return dateFinal;
    }

    public void setRenCode(int aValue){
       renCode = aValue;
    }

    public int getRenCode(){
       return renCode;
    }

    public void setShpzBalans(String aValue){
       shpzBalans = aValue;
    }

    public String getShpzBalans(){
       return shpzBalans;
    }

    public void setShpzFinId(int aValue){
       shpzFinId = aValue;
    }

    public int getShpzFinId(){
       return shpzFinId;
    }

    public void setKau_table_id_1884(int aValue){
       kau_table_id_1884 = aValue;
    }

    public int getKau_table_id_1884(){
       return kau_table_id_1884;
    }

    public void setKau_1884(String aValue){
       kau_1884 = aValue;
    }

    public String getKau_1884(){
       return kau_1884;
    }

    public void setName_1884(String aValue){
       name_1884 = aValue;
    }

    public String getName_1884(){
       return name_1884;
    }

    public void setHrmorganizationid(String aValue){
       hrmorganizationid = aValue;
    }

    public String getHrmorganizationid(){
       return hrmorganizationid;
    }

    public void setDomain_info(String aValue){
       domain_info = aValue;
    }

    public String getDomain_info(){
       return domain_info;
    }

    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }

    public void setParentRef(ENDepartmentRef aValue){
       parentRef = aValue;
    }

    public ENDepartmentRef getParentRef(){
       return parentRef;
    }
    public void setTypeRef(ENDepartmentTypeRef aValue){
       typeRef = aValue;
    }

    public ENDepartmentTypeRef getTypeRef(){
       return typeRef;
    }
    public void setManagementRef(ENManagementRef aValue){
       managementRef = aValue;
    }

    public ENManagementRef getManagementRef(){
       return managementRef;
    }

} // end of ENDepartmentValueObject


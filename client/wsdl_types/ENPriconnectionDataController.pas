unit ENPriconnectionDataController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENElementController
   ,ENTechConditionsServicesController
   ,ENConnectionCalcTypeController
;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Borland types; however, they could also
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:int             - "http://www.w3.org/2001/XMLSchema"
  // !:string          - "http://www.w3.org/2001/XMLSchema"
  // !:decimal         - "http://www.w3.org/2001/XMLSchema"
  // !:date            - "http://www.w3.org/2001/XMLSchema"
  // !:long            - "http://www.w3.org/2001/XMLSchema"
  // !:dateTime        - "http://www.w3.org/2001/XMLSchema"
  // !:EPCalculatorShortList - "http://ksoe.org/EnergyproControllerService/type/"
  // !:EPCalculatorFilter - "http://ksoe.org/EnergyproControllerService/type/"

  ENPriconnectionData            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPriconnectionDataRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPriconnectionData = class(TRemotable)
  private
    Fcode : Integer;
    FdateGen : TXSDate;
    FpowerMaxCurrent : TXSDecimal;
    FpowerMaxAfterReconstr : TXSDecimal;
    FpowerContractTotal : TXSDecimal;
    FpowerContractByt : TXSDecimal;
    FpowerContractProm : TXSDecimal;
    FpowerContractTU : TXSDecimal;
    FpowerContractNewTU : TXSDecimal;
    FpowerContractAllTU : TXSDecimal;
    FcountCustomer : Integer;
    FcountCustomerByt : Integer;
    FcountCustomerProm : Integer;
    FcoeffUsage : TXSDecimal;
    FpowerReserveCurrent : TXSDecimal;
    FpriceCurrent : TXSDecimal;
    FcostTPBuilding : TXSDecimal;
    FcostLines04Building : TXSDecimal;
    FcostLines04Building1 : TXSDecimal;
    FcostLines04Building2 : TXSDecimal;
    FcostLines04Building3 : TXSDecimal;
    FcostLines10Building : TXSDecimal;
    FcostLines10Building1 : TXSDecimal;
    FcostLines10Building2 : TXSDecimal;
    FcostLines10Building3 : TXSDecimal;
    FcostLines10Building4 : TXSDecimal;
    FcostDismantling : TXSDecimal;
    FpowerReserveAfterReconstr : TXSDecimal;
    FpriceAfterReconstr : TXSDecimal;
    FpaySum : TXSDecimal;
    FisLast : Integer;
    FcostFactExpenses : TXSDecimal;
    FincludeTU : Integer;
    FincludeAgreement : Integer;
    FincludeConnections : Integer;
    FwithOutReplacingTP : Integer;
    FcostTU : TXSDecimal;
    FcostAgreement : TXSDecimal;
    FcostConnections : TXSDecimal;
    FotherCosts : TXSDecimal;
    FcommentGen : WideString;
    Ft1powerCurrent : TXSDecimal;
    Ft1powerNew : TXSDecimal;
    Ft2powerCurrent : TXSDecimal;
    Ft2powerNew : TXSDecimal;
    Ft3powerCurrent : TXSDecimal;
    Ft3powerNew : TXSDecimal;
    FisPrimarySubstation : Integer;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
//???
    FelementRef : ENElementRef;
//???
    FparentRef : ENPriconnectionDataRef;
//???
    FtechCondServRef : ENTechConditionsServicesRef;
//???
    FcalcTypeRef : ENConnectionCalcTypeRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property powerMaxCurrent : TXSDecimal read FpowerMaxCurrent write FpowerMaxCurrent;
    property powerMaxAfterReconstr : TXSDecimal read FpowerMaxAfterReconstr write FpowerMaxAfterReconstr;
    property powerContractTotal : TXSDecimal read FpowerContractTotal write FpowerContractTotal;
    property powerContractByt : TXSDecimal read FpowerContractByt write FpowerContractByt;
    property powerContractProm : TXSDecimal read FpowerContractProm write FpowerContractProm;
    property powerContractTU : TXSDecimal read FpowerContractTU write FpowerContractTU;
    property powerContractNewTU : TXSDecimal read FpowerContractNewTU write FpowerContractNewTU;
    property powerContractAllTU : TXSDecimal read FpowerContractAllTU write FpowerContractAllTU;
    property  countCustomer : Integer read FcountCustomer write FcountCustomer;
    property  countCustomerByt : Integer read FcountCustomerByt write FcountCustomerByt;
    property  countCustomerProm : Integer read FcountCustomerProm write FcountCustomerProm;
    property coeffUsage : TXSDecimal read FcoeffUsage write FcoeffUsage;
    property powerReserveCurrent : TXSDecimal read FpowerReserveCurrent write FpowerReserveCurrent;
    property priceCurrent : TXSDecimal read FpriceCurrent write FpriceCurrent;
    property costTPBuilding : TXSDecimal read FcostTPBuilding write FcostTPBuilding;
    property costLines04Building : TXSDecimal read FcostLines04Building write FcostLines04Building;
    property costLines04Building1 : TXSDecimal read FcostLines04Building1 write FcostLines04Building1;
    property costLines04Building2 : TXSDecimal read FcostLines04Building2 write FcostLines04Building2;
    property costLines04Building3 : TXSDecimal read FcostLines04Building3 write FcostLines04Building3;
    property costLines10Building : TXSDecimal read FcostLines10Building write FcostLines10Building;
    property costLines10Building1 : TXSDecimal read FcostLines10Building1 write FcostLines10Building1;
    property costLines10Building2 : TXSDecimal read FcostLines10Building2 write FcostLines10Building2;
    property costLines10Building3 : TXSDecimal read FcostLines10Building3 write FcostLines10Building3;
    property costLines10Building4 : TXSDecimal read FcostLines10Building4 write FcostLines10Building4;
    property costDismantling : TXSDecimal read FcostDismantling write FcostDismantling;
    property powerReserveAfterReconstr : TXSDecimal read FpowerReserveAfterReconstr write FpowerReserveAfterReconstr;
    property priceAfterReconstr : TXSDecimal read FpriceAfterReconstr write FpriceAfterReconstr;
    property paySum : TXSDecimal read FpaySum write FpaySum;
    property isLast : Integer read FisLast write FisLast;
    property costFactExpenses : TXSDecimal read FcostFactExpenses write FcostFactExpenses;
    property includeTU : Integer read FincludeTU write FincludeTU;
    property includeAgreement : Integer read FincludeAgreement write FincludeAgreement;
    property includeConnections : Integer read FincludeConnections write FincludeConnections;
    property withOutReplacingTP : Integer read FwithOutReplacingTP write FwithOutReplacingTP;
    property costTU : TXSDecimal read FcostTU write FcostTU;
    property costAgreement : TXSDecimal read FcostAgreement write FcostAgreement;
    property costConnections : TXSDecimal read FcostConnections write FcostConnections;
    property otherCosts : TXSDecimal read FotherCosts write FotherCosts;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property t1powerCurrent : TXSDecimal read Ft1powerCurrent write Ft1powerCurrent;
    property t1powerNew : TXSDecimal read Ft1powerNew write Ft1powerNew;
    property t2powerCurrent : TXSDecimal read Ft2powerCurrent write Ft2powerCurrent;
    property t2powerNew : TXSDecimal read Ft2powerNew write Ft2powerNew;
    property t3powerCurrent : TXSDecimal read Ft3powerCurrent write Ft3powerCurrent;
    property t3powerNew : TXSDecimal read Ft3powerNew write Ft3powerNew;
    property isPrimarySubstation : Integer read FisPrimarySubstation write FisPrimarySubstation;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property elementRef : ENElementRef read FelementRef write FelementRef;
    property parentRef : ENPriconnectionDataRef read FparentRef write FparentRef;
    property techCondServRef : ENTechConditionsServicesRef read FtechCondServRef write FtechCondServRef;
    property calcTypeRef : ENConnectionCalcTypeRef read FcalcTypeRef write FcalcTypeRef;
  end;

{
  ENPriconnectionDataFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FdateGen : TXSDate;
    FpowerMaxCurrent : TXSDecimal;
    FpowerMaxAfterReconstr : TXSDecimal;
    FpowerContractTotal : TXSDecimal;
    FpowerContractByt : TXSDecimal;
    FpowerContractProm : TXSDecimal;
    FpowerContractTU : TXSDecimal;
    FpowerContractNewTU : TXSDecimal;
    FpowerContractAllTU : TXSDecimal;
    FcountCustomer : Integer;
    FcountCustomerByt : Integer;
    FcountCustomerProm : Integer;
    FcoeffUsage : TXSDecimal;
    FpowerReserveCurrent : TXSDecimal;
    FpriceCurrent : TXSDecimal;
    FcostTPBuilding : TXSDecimal;
    FcostLines04Building : TXSDecimal;
    FcostLines04Building1 : TXSDecimal;
    FcostLines04Building2 : TXSDecimal;
    FcostLines04Building3 : TXSDecimal;
    FcostLines10Building : TXSDecimal;
    FcostLines10Building1 : TXSDecimal;
    FcostLines10Building2 : TXSDecimal;
    FcostLines10Building3 : TXSDecimal;
    FcostLines10Building4 : TXSDecimal;
    FcostDismantling : TXSDecimal;
    FpowerReserveAfterReconstr : TXSDecimal;
    FpriceAfterReconstr : TXSDecimal;
    FpaySum : TXSDecimal;
    FisLast : Integer;
    FcostFactExpenses : TXSDecimal;
    FincludeTU : Integer;
    FincludeAgreement : Integer;
    FincludeConnections : Integer;
    FwithOutReplacingTP : Integer;
    FcostTU : TXSDecimal;
    FcostAgreement : TXSDecimal;
    FcostConnections : TXSDecimal;
    FotherCosts : TXSDecimal;
    FcommentGen : WideString;
    Ft1powerCurrent : TXSDecimal;
    Ft1powerNew : TXSDecimal;
    Ft2powerCurrent : TXSDecimal;
    Ft2powerNew : TXSDecimal;
    Ft3powerCurrent : TXSDecimal;
    Ft3powerNew : TXSDecimal;
    FisPrimarySubstation : Integer;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
//???
    FelementRef : ENElementRef;
//???
    FparentRef : ENPriconnectionDataRef;
//???
    FtechCondServRef : ENTechConditionsServicesRef;
//???
    FcalcTypeRef : ENConnectionCalcTypeRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property powerMaxCurrent : TXSDecimal read FpowerMaxCurrent write FpowerMaxCurrent;
    property powerMaxAfterReconstr : TXSDecimal read FpowerMaxAfterReconstr write FpowerMaxAfterReconstr;
    property powerContractTotal : TXSDecimal read FpowerContractTotal write FpowerContractTotal;
    property powerContractByt : TXSDecimal read FpowerContractByt write FpowerContractByt;
    property powerContractProm : TXSDecimal read FpowerContractProm write FpowerContractProm;
    property powerContractTU : TXSDecimal read FpowerContractTU write FpowerContractTU;
    property powerContractNewTU : TXSDecimal read FpowerContractNewTU write FpowerContractNewTU;
    property powerContractAllTU : TXSDecimal read FpowerContractAllTU write FpowerContractAllTU;
    property  countCustomer : Integer read FcountCustomer write FcountCustomer;
    property  countCustomerByt : Integer read FcountCustomerByt write FcountCustomerByt;
    property  countCustomerProm : Integer read FcountCustomerProm write FcountCustomerProm;
    property coeffUsage : TXSDecimal read FcoeffUsage write FcoeffUsage;
    property powerReserveCurrent : TXSDecimal read FpowerReserveCurrent write FpowerReserveCurrent;
    property priceCurrent : TXSDecimal read FpriceCurrent write FpriceCurrent;
    property costTPBuilding : TXSDecimal read FcostTPBuilding write FcostTPBuilding;
    property costLines04Building : TXSDecimal read FcostLines04Building write FcostLines04Building;
    property costLines04Building1 : TXSDecimal read FcostLines04Building1 write FcostLines04Building1;
    property costLines04Building2 : TXSDecimal read FcostLines04Building2 write FcostLines04Building2;
    property costLines04Building3 : TXSDecimal read FcostLines04Building3 write FcostLines04Building3;
    property costLines10Building : TXSDecimal read FcostLines10Building write FcostLines10Building;
    property costLines10Building1 : TXSDecimal read FcostLines10Building1 write FcostLines10Building1;
    property costLines10Building2 : TXSDecimal read FcostLines10Building2 write FcostLines10Building2;
    property costLines10Building3 : TXSDecimal read FcostLines10Building3 write FcostLines10Building3;
    property costLines10Building4 : TXSDecimal read FcostLines10Building4 write FcostLines10Building4;
    property costDismantling : TXSDecimal read FcostDismantling write FcostDismantling;
    property powerReserveAfterReconstr : TXSDecimal read FpowerReserveAfterReconstr write FpowerReserveAfterReconstr;
    property priceAfterReconstr : TXSDecimal read FpriceAfterReconstr write FpriceAfterReconstr;
    property paySum : TXSDecimal read FpaySum write FpaySum;
    property  isLast : Integer read FisLast write FisLast;
    property costFactExpenses : TXSDecimal read FcostFactExpenses write FcostFactExpenses;
    property  includeTU : Integer read FincludeTU write FincludeTU;
    property  includeAgreement : Integer read FincludeAgreement write FincludeAgreement;
    property  includeConnections : Integer read FincludeConnections write FincludeConnections;
    property  withOutReplacingTP : Integer read FwithOutReplacingTP write FwithOutReplacingTP;
    property costTU : TXSDecimal read FcostTU write FcostTU;
    property costAgreement : TXSDecimal read FcostAgreement write FcostAgreement;
    property costConnections : TXSDecimal read FcostConnections write FcostConnections;
    property otherCosts : TXSDecimal read FotherCosts write FotherCosts;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property t1powerCurrent : TXSDecimal read Ft1powerCurrent write Ft1powerCurrent;
    property t1powerNew : TXSDecimal read Ft1powerNew write Ft1powerNew;
    property t2powerCurrent : TXSDecimal read Ft2powerCurrent write Ft2powerCurrent;
    property t2powerNew : TXSDecimal read Ft2powerNew write Ft2powerNew;
    property t3powerCurrent : TXSDecimal read Ft3powerCurrent write Ft3powerCurrent;
    property t3powerNew : TXSDecimal read Ft3powerNew write Ft3powerNew;
    property  isPrimarySubstation : Integer read FisPrimarySubstation write FisPrimarySubstation;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property elementRef : ENElementRef read FelementRef write FelementRef;
    property parentRef : ENPriconnectionDataRef read FparentRef write FparentRef;
    property techCondServRef : ENTechConditionsServicesRef read FtechCondServRef write FtechCondServRef;
    property calcTypeRef : ENConnectionCalcTypeRef read FcalcTypeRef write FcalcTypeRef;
  end;
}

  ENPriconnectionDataFilter = class(ENPriconnectionData)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENPriconnectionDataShort = class(TRemotable)
  private
    Fcode : Integer;
    FdateGen : TXSDate;
    FpowerMaxCurrent : TXSDecimal;
    FpowerMaxAfterReconstr : TXSDecimal;
    FpowerContractTotal : TXSDecimal;
    FpowerContractByt : TXSDecimal;
    FpowerContractProm : TXSDecimal;
    FpowerContractTU : TXSDecimal;
    FpowerContractNewTU : TXSDecimal;
    FpowerContractAllTU : TXSDecimal;
    FcountCustomer : Integer;
    FcountCustomerByt : Integer;
    FcountCustomerProm : Integer;
    FcoeffUsage : TXSDecimal;
    FpowerReserveCurrent : TXSDecimal;
    FpriceCurrent : TXSDecimal;
    FcostTPBuilding : TXSDecimal;
    FcostLines04Building : TXSDecimal;
    FcostLines04Building1 : TXSDecimal;
    FcostLines04Building2 : TXSDecimal;
    FcostLines04Building3 : TXSDecimal;
    FcostLines10Building : TXSDecimal;
    FcostLines10Building1 : TXSDecimal;
    FcostLines10Building2 : TXSDecimal;
    FcostLines10Building3 : TXSDecimal;
    FcostLines10Building4 : TXSDecimal;
    FcostDismantling : TXSDecimal;
    FpowerReserveAfterReconstr : TXSDecimal;
    FpriceAfterReconstr : TXSDecimal;
    FpaySum : TXSDecimal;
    FisLast : Integer;
    FcostFactExpenses : TXSDecimal;
    FincludeTU : Integer;
    FincludeAgreement : Integer;
    FincludeConnections : Integer;
    FwithOutReplacingTP : Integer;
    FcostTU : TXSDecimal;
    FcostAgreement : TXSDecimal;
    FcostConnections : TXSDecimal;
    FotherCosts : TXSDecimal;
    FcommentGen : WideString;
    Ft1powerCurrent : TXSDecimal;
    Ft1powerNew : TXSDecimal;
    Ft2powerCurrent : TXSDecimal;
    Ft2powerNew : TXSDecimal;
    Ft3powerCurrent : TXSDecimal;
    Ft3powerNew : TXSDecimal;
    FisPrimarySubstation : Integer;
    FuserGen : WideString;
    FelementRefCode : Integer;
    FparentRefCode : Integer;
    FparentRefDateGen : TXSDate;
    FparentRefPowerMaxCurrent : TXSDecimal;
    FparentRefPowerMaxAfterReconstr : TXSDecimal;
    FparentRefPowerContractTotal : TXSDecimal;
    FparentRefPowerContractByt : TXSDecimal;
    FparentRefPowerContractProm : TXSDecimal;
    FparentRefPowerContractTU : TXSDecimal;
    FparentRefPowerContractNewTU : TXSDecimal;
    FparentRefPowerContractAllTU : TXSDecimal;
    FparentRefCountCustomer : Integer;
    FparentRefCountCustomerByt : Integer;
    FparentRefCountCustomerProm : Integer;
    FparentRefCoeffUsage : TXSDecimal;
    FparentRefPowerReserveCurrent : TXSDecimal;
    FparentRefPriceCurrent : TXSDecimal;
    FparentRefCostTPBuilding : TXSDecimal;
    FparentRefCostLines04Building : TXSDecimal;
    FparentRefCostLines04Building1 : TXSDecimal;
    FparentRefCostLines04Building2 : TXSDecimal;
    FparentRefCostLines04Building3 : TXSDecimal;
    FparentRefCostLines10Building : TXSDecimal;
    FparentRefCostLines10Building1 : TXSDecimal;
    FparentRefCostLines10Building2 : TXSDecimal;
    FparentRefCostLines10Building3 : TXSDecimal;
    FparentRefCostLines10Building4 : TXSDecimal;
    FparentRefCostDismantling : TXSDecimal;
    FparentRefPowerReserveAfterReconstr : TXSDecimal;
    FparentRefPriceAfterReconstr : TXSDecimal;
    FparentRefPaySum : TXSDecimal;
    FparentRefIsLast : Integer;
    FparentRefCostFactExpenses : TXSDecimal;
    FparentRefIncludeTU : Integer;
    FparentRefIncludeAgreement : Integer;
    FparentRefIncludeConnections : Integer;
    FparentRefWithOutReplacingTP : Integer;
    FparentRefCostTU : TXSDecimal;
    FparentRefCostAgreement : TXSDecimal;
    FparentRefCostConnections : TXSDecimal;
    FparentRefOtherCosts : TXSDecimal;
    FparentRefCommentGen : WideString;
    FparentRefT1powerCurrent : TXSDecimal;
    FparentRefT1powerNew : TXSDecimal;
    FparentRefT2powerCurrent : TXSDecimal;
    FparentRefT2powerNew : TXSDecimal;
    FparentRefT3powerCurrent : TXSDecimal;
    FparentRefT3powerNew : TXSDecimal;
    FparentRefIsPrimarySubstation : Integer;
    FparentRefUserGen : WideString;
    FtechCondServRefCode : Integer;
    FtechCondServRefContractNumber : WideString;
    FtechCondServRefContractDate : TXSDate;
    FtechCondServRefFinContractNumber : WideString;
    FtechCondServRefFinContractDate : TXSDate;
    FtechCondServRefPartnerName : WideString;
    FtechCondServRefPartnerCode : WideString;
    FtechCondServRefFinDocCode : WideString;
    FtechCondServRefFinDocID : Integer;
    FtechCondServRefFinCommentGen : WideString;
    FtechCondServRefTySummaGen : TXSDecimal;
    FtechCondServRefTySummaVat : TXSDecimal;
    FtechCondServRefTyServicesSumma : TXSDecimal;
    FtechCondServRefTyServicesPower : TXSDecimal;
    FtechCondServRefCommentServicesGen : WideString;
    FtechCondServRefUserGen : WideString;
    FtechCondServRefDateEdit : TXSDate;
    FtechCondServRefCnPackCode : Integer;
    FtechCondServRefExecutionTerm : WideString;
    FtechCondServRefBuildersArea : Integer;
    FtechCondServRefContractDateFinal : TXSDate;
    FtechCondServRefIsSea : Integer;
    FcalcTypeRefCode : Integer;
    FcalcTypeRefName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property powerMaxCurrent : TXSDecimal read FpowerMaxCurrent write FpowerMaxCurrent;
    property powerMaxAfterReconstr : TXSDecimal read FpowerMaxAfterReconstr write FpowerMaxAfterReconstr;
    property powerContractTotal : TXSDecimal read FpowerContractTotal write FpowerContractTotal;
    property powerContractByt : TXSDecimal read FpowerContractByt write FpowerContractByt;
    property powerContractProm : TXSDecimal read FpowerContractProm write FpowerContractProm;
    property powerContractTU : TXSDecimal read FpowerContractTU write FpowerContractTU;
    property powerContractNewTU : TXSDecimal read FpowerContractNewTU write FpowerContractNewTU;
    property powerContractAllTU : TXSDecimal read FpowerContractAllTU write FpowerContractAllTU;
    property  countCustomer : Integer read FcountCustomer write FcountCustomer;
    property  countCustomerByt : Integer read FcountCustomerByt write FcountCustomerByt;
    property  countCustomerProm : Integer read FcountCustomerProm write FcountCustomerProm;
    property coeffUsage : TXSDecimal read FcoeffUsage write FcoeffUsage;
    property powerReserveCurrent : TXSDecimal read FpowerReserveCurrent write FpowerReserveCurrent;
    property priceCurrent : TXSDecimal read FpriceCurrent write FpriceCurrent;
    property costTPBuilding : TXSDecimal read FcostTPBuilding write FcostTPBuilding;
    property costLines04Building : TXSDecimal read FcostLines04Building write FcostLines04Building;
    property costLines04Building1 : TXSDecimal read FcostLines04Building1 write FcostLines04Building1;
    property costLines04Building2 : TXSDecimal read FcostLines04Building2 write FcostLines04Building2;
    property costLines04Building3 : TXSDecimal read FcostLines04Building3 write FcostLines04Building3;
    property costLines10Building : TXSDecimal read FcostLines10Building write FcostLines10Building;
    property costLines10Building1 : TXSDecimal read FcostLines10Building1 write FcostLines10Building1;
    property costLines10Building2 : TXSDecimal read FcostLines10Building2 write FcostLines10Building2;
    property costLines10Building3 : TXSDecimal read FcostLines10Building3 write FcostLines10Building3;
    property costLines10Building4 : TXSDecimal read FcostLines10Building4 write FcostLines10Building4;
    property costDismantling : TXSDecimal read FcostDismantling write FcostDismantling;
    property powerReserveAfterReconstr : TXSDecimal read FpowerReserveAfterReconstr write FpowerReserveAfterReconstr;
    property priceAfterReconstr : TXSDecimal read FpriceAfterReconstr write FpriceAfterReconstr;
    property paySum : TXSDecimal read FpaySum write FpaySum;
    property  isLast : Integer read FisLast write FisLast;
    property costFactExpenses : TXSDecimal read FcostFactExpenses write FcostFactExpenses;
    property  includeTU : Integer read FincludeTU write FincludeTU;
    property  includeAgreement : Integer read FincludeAgreement write FincludeAgreement;
    property  includeConnections : Integer read FincludeConnections write FincludeConnections;
    property  withOutReplacingTP : Integer read FwithOutReplacingTP write FwithOutReplacingTP;
    property costTU : TXSDecimal read FcostTU write FcostTU;
    property costAgreement : TXSDecimal read FcostAgreement write FcostAgreement;
    property costConnections : TXSDecimal read FcostConnections write FcostConnections;
    property otherCosts : TXSDecimal read FotherCosts write FotherCosts;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property t1powerCurrent : TXSDecimal read Ft1powerCurrent write Ft1powerCurrent;
    property t1powerNew : TXSDecimal read Ft1powerNew write Ft1powerNew;
    property t2powerCurrent : TXSDecimal read Ft2powerCurrent write Ft2powerCurrent;
    property t2powerNew : TXSDecimal read Ft2powerNew write Ft2powerNew;
    property t3powerCurrent : TXSDecimal read Ft3powerCurrent write Ft3powerCurrent;
    property t3powerNew : TXSDecimal read Ft3powerNew write Ft3powerNew;
    property  isPrimarySubstation : Integer read FisPrimarySubstation write FisPrimarySubstation;
    property userGen : WideString read FuserGen write FuserGen;

    property elementRefCode : Integer read FelementRefCode write FelementRefCode;
    property parentRefCode : Integer read FparentRefCode write FparentRefCode;
    property parentRefDateGen : TXSDate read FparentRefDateGen write FparentRefDateGen;
    property parentRefPowerMaxCurrent : TXSDecimal read FparentRefPowerMaxCurrent write FparentRefPowerMaxCurrent;
    property parentRefPowerMaxAfterReconstr : TXSDecimal read FparentRefPowerMaxAfterReconstr write FparentRefPowerMaxAfterReconstr;
    property parentRefPowerContractTotal : TXSDecimal read FparentRefPowerContractTotal write FparentRefPowerContractTotal;
    property parentRefPowerContractByt : TXSDecimal read FparentRefPowerContractByt write FparentRefPowerContractByt;
    property parentRefPowerContractProm : TXSDecimal read FparentRefPowerContractProm write FparentRefPowerContractProm;
    property parentRefPowerContractTU : TXSDecimal read FparentRefPowerContractTU write FparentRefPowerContractTU;
    property parentRefPowerContractNewTU : TXSDecimal read FparentRefPowerContractNewTU write FparentRefPowerContractNewTU;
    property parentRefPowerContractAllTU : TXSDecimal read FparentRefPowerContractAllTU write FparentRefPowerContractAllTU;
    property parentRefCountCustomer : Integer read FparentRefCountCustomer write FparentRefCountCustomer;
    property parentRefCountCustomerByt : Integer read FparentRefCountCustomerByt write FparentRefCountCustomerByt;
    property parentRefCountCustomerProm : Integer read FparentRefCountCustomerProm write FparentRefCountCustomerProm;
    property parentRefCoeffUsage : TXSDecimal read FparentRefCoeffUsage write FparentRefCoeffUsage;
    property parentRefPowerReserveCurrent : TXSDecimal read FparentRefPowerReserveCurrent write FparentRefPowerReserveCurrent;
    property parentRefPriceCurrent : TXSDecimal read FparentRefPriceCurrent write FparentRefPriceCurrent;
    property parentRefCostTPBuilding : TXSDecimal read FparentRefCostTPBuilding write FparentRefCostTPBuilding;
    property parentRefCostLines04Building : TXSDecimal read FparentRefCostLines04Building write FparentRefCostLines04Building;
    property parentRefCostLines04Building1 : TXSDecimal read FparentRefCostLines04Building1 write FparentRefCostLines04Building1;
    property parentRefCostLines04Building2 : TXSDecimal read FparentRefCostLines04Building2 write FparentRefCostLines04Building2;
    property parentRefCostLines04Building3 : TXSDecimal read FparentRefCostLines04Building3 write FparentRefCostLines04Building3;
    property parentRefCostLines10Building : TXSDecimal read FparentRefCostLines10Building write FparentRefCostLines10Building;
    property parentRefCostLines10Building1 : TXSDecimal read FparentRefCostLines10Building1 write FparentRefCostLines10Building1;
    property parentRefCostLines10Building2 : TXSDecimal read FparentRefCostLines10Building2 write FparentRefCostLines10Building2;
    property parentRefCostLines10Building3 : TXSDecimal read FparentRefCostLines10Building3 write FparentRefCostLines10Building3;
    property parentRefCostLines10Building4 : TXSDecimal read FparentRefCostLines10Building4 write FparentRefCostLines10Building4;
    property parentRefCostDismantling : TXSDecimal read FparentRefCostDismantling write FparentRefCostDismantling;
    property parentRefPowerReserveAfterReconstr : TXSDecimal read FparentRefPowerReserveAfterReconstr write FparentRefPowerReserveAfterReconstr;
    property parentRefPriceAfterReconstr : TXSDecimal read FparentRefPriceAfterReconstr write FparentRefPriceAfterReconstr;
    property parentRefPaySum : TXSDecimal read FparentRefPaySum write FparentRefPaySum;
    property parentRefIsLast : Integer read FparentRefIsLast write FparentRefIsLast;
    property parentRefCostFactExpenses : TXSDecimal read FparentRefCostFactExpenses write FparentRefCostFactExpenses;
    property parentRefIncludeTU : Integer read FparentRefIncludeTU write FparentRefIncludeTU;
    property parentRefIncludeAgreement : Integer read FparentRefIncludeAgreement write FparentRefIncludeAgreement;
    property parentRefIncludeConnections : Integer read FparentRefIncludeConnections write FparentRefIncludeConnections;
    property parentRefWithOutReplacingTP : Integer read FparentRefWithOutReplacingTP write FparentRefWithOutReplacingTP;
    property parentRefCostTU : TXSDecimal read FparentRefCostTU write FparentRefCostTU;
    property parentRefCostAgreement : TXSDecimal read FparentRefCostAgreement write FparentRefCostAgreement;
    property parentRefCostConnections : TXSDecimal read FparentRefCostConnections write FparentRefCostConnections;
    property parentRefOtherCosts : TXSDecimal read FparentRefOtherCosts write FparentRefOtherCosts;
    property parentRefCommentGen : WideString read FparentRefCommentGen write FparentRefCommentGen;
    property parentReft1powerCurrent : TXSDecimal read FparentRefT1powerCurrent write FparentRefT1powerCurrent;
    property parentReft1powerNew : TXSDecimal read FparentRefT1powerNew write FparentRefT1powerNew;
    property parentReft2powerCurrent : TXSDecimal read FparentRefT2powerCurrent write FparentRefT2powerCurrent;
    property parentReft2powerNew : TXSDecimal read FparentRefT2powerNew write FparentRefT2powerNew;
    property parentReft3powerCurrent : TXSDecimal read FparentRefT3powerCurrent write FparentRefT3powerCurrent;
    property parentReft3powerNew : TXSDecimal read FparentRefT3powerNew write FparentRefT3powerNew;
    property parentRefIsPrimarySubstation : Integer read FparentRefIsPrimarySubstation write FparentRefIsPrimarySubstation;
    property parentRefUserGen : WideString read FparentRefUserGen write FparentRefUserGen;
    property techCondServRefCode : Integer read FtechCondServRefCode write FtechCondServRefCode;
    property techCondServRefContractNumber : WideString read FtechCondServRefContractNumber write FtechCondServRefContractNumber;
    property techCondServRefContractDate : TXSDate read FtechCondServRefContractDate write FtechCondServRefContractDate;
    property techCondServRefFinContractNumber : WideString read FtechCondServRefFinContractNumber write FtechCondServRefFinContractNumber;
    property techCondServRefFinContractDate : TXSDate read FtechCondServRefFinContractDate write FtechCondServRefFinContractDate;
    property techCondServRefPartnerName : WideString read FtechCondServRefPartnerName write FtechCondServRefPartnerName;
    property techCondServRefPartnerCode : WideString read FtechCondServRefPartnerCode write FtechCondServRefPartnerCode;
    property techCondServRefFinDocCode : WideString read FtechCondServRefFinDocCode write FtechCondServRefFinDocCode;
    property techCondServRefFinDocID : Integer read FtechCondServRefFinDocID write FtechCondServRefFinDocID;
    property techCondServRefFinCommentGen : WideString read FtechCondServRefFinCommentGen write FtechCondServRefFinCommentGen;
    property techCondServRefTySummaGen : TXSDecimal read FtechCondServRefTySummaGen write FtechCondServRefTySummaGen;
    property techCondServRefTySummaVat : TXSDecimal read FtechCondServRefTySummaVat write FtechCondServRefTySummaVat;
    property techCondServRefTyServicesSumma : TXSDecimal read FtechCondServRefTyServicesSumma write FtechCondServRefTyServicesSumma;
    property techCondServRefTyServicesPower : TXSDecimal read FtechCondServRefTyServicesPower write FtechCondServRefTyServicesPower;
    property techCondServRefCommentServicesGen : WideString read FtechCondServRefCommentServicesGen write FtechCondServRefCommentServicesGen;
    property techCondServRefUserGen : WideString read FtechCondServRefUserGen write FtechCondServRefUserGen;
    property techCondServRefDateEdit : TXSDate read FtechCondServRefDateEdit write FtechCondServRefDateEdit;
    property techCondServRefCnPackCode : Integer read FtechCondServRefCnPackCode write FtechCondServRefCnPackCode;
    property techCondServRefExecutionTerm : WideString read FtechCondServRefExecutionTerm write FtechCondServRefExecutionTerm;
    property techCondServRefBuildersArea : Integer read FtechCondServRefBuildersArea write FtechCondServRefBuildersArea;
    property techCondServRefContractDateFinal : TXSDate read FtechCondServRefContractDateFinal write FtechCondServRefContractDateFinal;
    property techCondServRefIsSea : Integer read FtechCondServRefIsSea write FtechCondServRefIsSea;
    property calcTypeRefCode : Integer read FcalcTypeRefCode write FcalcTypeRefCode;
    property calcTypeRefName : WideString read FcalcTypeRefName write FcalcTypeRefName;
  end;

  ArrayOfENPriconnectionDataShort = array of ENPriconnectionDataShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENPriconnectionDataShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENPriconnectionDataShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENPriconnectionDataShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENPriconnectionDataController/message/
  // soapAction: http://ksoe.org/ENPriconnectionDataController/action/ENPriconnectionDataController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENPriconnectionDataControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENPriconnectionDataController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENPriconnectionDataControllerSoapPort = interface(IInvokable)
  ['{8234B1F0-E85C-4708-BBA4-F4A2CD6D9498}']
    function add(const aENPriconnectionData: ENPriconnectionData): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENPriconnectionData: ENPriconnectionData); stdcall;
    function getObject(const anObjectCode: Integer): ENPriconnectionData; stdcall;
    function getList: ENPriconnectionDataShortList; stdcall;
    function getFilteredList(const aENPriconnectionDataFilter: ENPriconnectionDataFilter): ENPriconnectionDataShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENPriconnectionDataShortList; stdcall;
    function getScrollableFilteredList(const aENPriconnectionDataFilter: ENPriconnectionDataFilter; const aFromPosition: Integer; const aQuantity: Integer): ENPriconnectionDataShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENPriconnectionDataShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENPriconnectionDataFilter: ENPriconnectionDataFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENPriconnectionDataShort; stdcall;

    // ENPriconnectionData. Получить данные для расчета
    function getCalculationDataObject(const elementCode: Integer; const tcsCode: Integer; const isPrimarySubstation: Integer): ENPriconnectionData; stdcall;

    // ENPriconnectionData. Расчитать стоимость присоединения
    function calculateData(const aENPriconnectionData: ENPriconnectionData): ENPriconnectionData; stdcall;
    // ENPriconnectionData. Сохранить расчет стоимости присоединения
    function saveCalculatedData(const aENPriconnectionData: ENPriconnectionData): Integer; stdcall;

  end;


implementation

  destructor ENPriconnectionData.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FpowerMaxCurrent) then
      powerMaxCurrent.Free;
    if Assigned(FpowerMaxAfterReconstr) then
      powerMaxAfterReconstr.Free;
    if Assigned(FpowerContractTotal) then
      powerContractTotal.Free;
    if Assigned(FpowerContractByt) then
      powerContractByt.Free;
    if Assigned(FpowerContractProm) then
      powerContractProm.Free;
    if Assigned(FpowerContractTU) then
      powerContractTU.Free;
    if Assigned(FpowerContractNewTU) then
      powerContractNewTU.Free;
    if Assigned(FpowerContractAllTU) then
      powerContractAllTU.Free;
    if Assigned(FcoeffUsage) then
      coeffUsage.Free;
    if Assigned(FpowerReserveCurrent) then
      powerReserveCurrent.Free;
    if Assigned(FpriceCurrent) then
      priceCurrent.Free;
    if Assigned(FcostTPBuilding) then
      costTPBuilding.Free;
    if Assigned(FcostLines04Building) then
      costLines04Building.Free;
    if Assigned(FcostLines04Building1) then
      costLines04Building1.Free;
    if Assigned(FcostLines04Building2) then
      costLines04Building2.Free;
    if Assigned(FcostLines04Building3) then
      costLines04Building3.Free;
    if Assigned(FcostLines10Building) then
      costLines10Building.Free;
    if Assigned(FcostLines10Building1) then
      costLines10Building1.Free;
    if Assigned(FcostLines10Building2) then
      costLines10Building2.Free;
    if Assigned(FcostLines10Building3) then
      costLines10Building3.Free;
    if Assigned(FcostLines10Building4) then
      costLines10Building4.Free;
    if Assigned(FcostDismantling) then
      costDismantling.Free;
    if Assigned(FpowerReserveAfterReconstr) then
      powerReserveAfterReconstr.Free;
    if Assigned(FpriceAfterReconstr) then
      priceAfterReconstr.Free;
    if Assigned(FpaySum) then
      paySum.Free;
    if Assigned(FcostFactExpenses) then
      costFactExpenses.Free;
    if Assigned(FcostTU) then
      costTU.Free;
    if Assigned(FcostAgreement) then
      costAgreement.Free;
    if Assigned(FcostConnections) then
      costConnections.Free;
    if Assigned(FotherCosts) then
      otherCosts.Free;
    if Assigned(Ft1powerCurrent) then
      t1powerCurrent.Free;
    if Assigned(Ft1powerNew) then
      t1powerNew.Free;
    if Assigned(Ft2powerCurrent) then
      t2powerCurrent.Free;
    if Assigned(Ft2powerNew) then
      t2powerNew.Free;
    if Assigned(Ft3powerCurrent) then
      t3powerCurrent.Free;
    if Assigned(Ft3powerNew) then
      t3powerNew.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FelementRef) then
      elementRef.Free;
    if Assigned(FparentRef) then
      parentRef.Free;
    if Assigned(FtechCondServRef) then
      techCondServRef.Free;
    if Assigned(FcalcTypeRef) then
      calcTypeRef.Free;
    inherited Destroy;
  end;

{
  destructor ENPriconnectionDataFilter.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FpowerMaxCurrent) then
      powerMaxCurrent.Free;
    if Assigned(FpowerMaxAfterReconstr) then
      powerMaxAfterReconstr.Free;
    if Assigned(FpowerContractTotal) then
      powerContractTotal.Free;
    if Assigned(FpowerContractByt) then
      powerContractByt.Free;
    if Assigned(FpowerContractProm) then
      powerContractProm.Free;
    if Assigned(FpowerContractTU) then
      powerContractTU.Free;
    if Assigned(FpowerContractNewTU) then
      powerContractNewTU.Free;
    if Assigned(FpowerContractAllTU) then
      powerContractAllTU.Free;
    if Assigned(FcoeffUsage) then
      coeffUsage.Free;
    if Assigned(FpowerReserveCurrent) then
      powerReserveCurrent.Free;
    if Assigned(FpriceCurrent) then
      priceCurrent.Free;
    if Assigned(FcostTPBuilding) then
      costTPBuilding.Free;
    if Assigned(FcostLines04Building) then
      costLines04Building.Free;
    if Assigned(FcostLines04Building1) then
      costLines04Building1.Free;
    if Assigned(FcostLines04Building2) then
      costLines04Building2.Free;
    if Assigned(FcostLines04Building3) then
      costLines04Building3.Free;
    if Assigned(FcostLines10Building) then
      costLines10Building.Free;
    if Assigned(FcostLines10Building1) then
      costLines10Building1.Free;
    if Assigned(FcostLines10Building2) then
      costLines10Building2.Free;
    if Assigned(FcostLines10Building3) then
      costLines10Building3.Free;
    if Assigned(FcostLines10Building4) then
      costLines10Building4.Free;
    if Assigned(FcostDismantling) then
      costDismantling.Free;
    if Assigned(FpowerReserveAfterReconstr) then
      powerReserveAfterReconstr.Free;
    if Assigned(FpriceAfterReconstr) then
      priceAfterReconstr.Free;
    if Assigned(FpaySum) then
      paySum.Free;
    if Assigned(FcostFactExpenses) then
      costFactExpenses.Free;
    if Assigned(FcostTU) then
      costTU.Free;
    if Assigned(FcostAgreement) then
      costAgreement.Free;
    if Assigned(FcostConnections) then
      costConnections.Free;
    if Assigned(FotherCosts) then
      otherCosts.Free;
    if Assigned(Ft1powerCurrent) then
      t1powerCurrent.Free;
    if Assigned(Ft1powerNew) then
      t1powerNew.Free;
    if Assigned(Ft2powerCurrent) then
      t2powerCurrent.Free;
    if Assigned(Ft2powerNew) then
      t2powerNew.Free;
    if Assigned(Ft3powerCurrent) then
      t3powerCurrent.Free;
    if Assigned(Ft3powerNew) then
      t3powerNew.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FelementRef) then
      elementRef.Free;
    if Assigned(FparentRef) then
      parentRef.Free;
    if Assigned(FtechCondServRef) then
      techCondServRef.Free;
    if Assigned(FcalcTypeRef) then
      calcTypeRef.Free;
    inherited Destroy;
  end;
}

  destructor ENPriconnectionDataFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENPriconnectionDataShort.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FpowerMaxCurrent) then
      powerMaxCurrent.Free;
    if Assigned(FpowerMaxAfterReconstr) then
      powerMaxAfterReconstr.Free;
    if Assigned(FpowerContractTotal) then
      powerContractTotal.Free;
    if Assigned(FpowerContractByt) then
      powerContractByt.Free;
    if Assigned(FpowerContractProm) then
      powerContractProm.Free;
    if Assigned(FpowerContractTU) then
      powerContractTU.Free;
    if Assigned(FpowerContractNewTU) then
      powerContractNewTU.Free;
    if Assigned(FpowerContractAllTU) then
      powerContractAllTU.Free;
    if Assigned(FcoeffUsage) then
      coeffUsage.Free;
    if Assigned(FpowerReserveCurrent) then
      powerReserveCurrent.Free;
    if Assigned(FpriceCurrent) then
      priceCurrent.Free;
    if Assigned(FcostTPBuilding) then
      costTPBuilding.Free;
    if Assigned(FcostLines04Building) then
      costLines04Building.Free;
    if Assigned(FcostLines04Building1) then
      costLines04Building1.Free;
    if Assigned(FcostLines04Building2) then
      costLines04Building2.Free;
    if Assigned(FcostLines04Building3) then
      costLines04Building3.Free;
    if Assigned(FcostLines10Building) then
      costLines10Building.Free;
    if Assigned(FcostLines10Building1) then
      costLines10Building1.Free;
    if Assigned(FcostLines10Building2) then
      costLines10Building2.Free;
    if Assigned(FcostLines10Building3) then
      costLines10Building3.Free;
    if Assigned(FcostLines10Building4) then
      costLines10Building4.Free;
    if Assigned(FcostDismantling) then
      costDismantling.Free;
    if Assigned(FpowerReserveAfterReconstr) then
      powerReserveAfterReconstr.Free;
    if Assigned(FpriceAfterReconstr) then
      priceAfterReconstr.Free;
    if Assigned(FpaySum) then
      paySum.Free;
    if Assigned(FcostFactExpenses) then
      costFactExpenses.Free;
    if Assigned(FcostTU) then
      costTU.Free;
    if Assigned(FcostAgreement) then
      costAgreement.Free;
    if Assigned(FcostConnections) then
      costConnections.Free;
    if Assigned(FotherCosts) then
      otherCosts.Free;
    if Assigned(Ft1powerCurrent) then
      t1powerCurrent.Free;
    if Assigned(Ft1powerNew) then
      t1powerNew.Free;
    if Assigned(Ft2powerCurrent) then
      t2powerCurrent.Free;
    if Assigned(Ft2powerNew) then
      t2powerNew.Free;
    if Assigned(Ft3powerCurrent) then
      t3powerCurrent.Free;
    if Assigned(Ft3powerNew) then
      t3powerNew.Free;
    if Assigned(FparentRefDateGen) then
      parentRefDateGen.Free;
    if Assigned(FparentRefPowerMaxCurrent) then
      parentRefPowerMaxCurrent.Free;
    if Assigned(FparentRefPowerMaxAfterReconstr) then
      parentRefPowerMaxAfterReconstr.Free;
    if Assigned(FparentRefPowerContractTotal) then
      parentRefPowerContractTotal.Free;
    if Assigned(FparentRefPowerContractByt) then
      parentRefPowerContractByt.Free;
    if Assigned(FparentRefPowerContractProm) then
      parentRefPowerContractProm.Free;
    if Assigned(FparentRefPowerContractTU) then
      parentRefPowerContractTU.Free;
    if Assigned(FparentRefPowerContractNewTU) then
      parentRefPowerContractNewTU.Free;
    if Assigned(FparentRefPowerContractAllTU) then
      parentRefPowerContractAllTU.Free;
    if Assigned(FparentRefCoeffUsage) then
      parentRefCoeffUsage.Free;
    if Assigned(FparentRefPowerReserveCurrent) then
      parentRefPowerReserveCurrent.Free;
    if Assigned(FparentRefPriceCurrent) then
      parentRefPriceCurrent.Free;
    if Assigned(FparentRefCostTPBuilding) then
      parentRefCostTPBuilding.Free;
    if Assigned(FparentRefCostLines04Building) then
      parentRefCostLines04Building.Free;
    if Assigned(FparentRefCostLines04Building1) then
      parentRefCostLines04Building1.Free;
    if Assigned(FparentRefCostLines04Building2) then
      parentRefCostLines04Building2.Free;
    if Assigned(FparentRefCostLines04Building3) then
      parentRefCostLines04Building3.Free;
    if Assigned(FparentRefCostLines10Building) then
      parentRefCostLines10Building.Free;
    if Assigned(FparentRefCostLines10Building1) then
      parentRefCostLines10Building1.Free;
    if Assigned(FparentRefCostLines10Building2) then
      parentRefCostLines10Building2.Free;
    if Assigned(FparentRefCostLines10Building3) then
      parentRefCostLines10Building3.Free;
    if Assigned(FparentRefCostLines10Building4) then
      parentRefCostLines10Building4.Free;
    if Assigned(FparentRefCostDismantling) then
      parentRefCostDismantling.Free;
    if Assigned(FparentRefPowerReserveAfterReconstr) then
      parentRefPowerReserveAfterReconstr.Free;
    if Assigned(FparentRefPriceAfterReconstr) then
      parentRefPriceAfterReconstr.Free;
    if Assigned(FparentRefPaySum) then
      parentRefPaySum.Free;
    if Assigned(FparentRefCostFactExpenses) then
      parentRefCostFactExpenses.Free;
    if Assigned(FparentRefCostTU) then
      parentRefCostTU.Free;
    if Assigned(FparentRefCostAgreement) then
      parentRefCostAgreement.Free;
    if Assigned(FparentRefCostConnections) then
      parentRefCostConnections.Free;
    if Assigned(FparentRefOtherCosts) then
      parentRefOtherCosts.Free;
    if Assigned(FparentRefT1powerCurrent) then
      parentReft1powerCurrent.Free;
    if Assigned(FparentRefT1powerNew) then
      parentReft1powerNew.Free;
    if Assigned(FparentRefT2powerCurrent) then
      parentReft2powerCurrent.Free;
    if Assigned(FparentRefT2powerNew) then
      parentReft2powerNew.Free;
    if Assigned(FparentRefT3powerCurrent) then
      parentReft3powerCurrent.Free;
    if Assigned(FparentRefT3powerNew) then
      parentReft3powerNew.Free;
    if Assigned(FtechCondServRefContractDate) then
      techCondServRefContractDate.Free;
    if Assigned(FtechCondServRefFinContractDate) then
      techCondServRefFinContractDate.Free;
    if Assigned(FtechCondServRefTySummaGen) then
      techCondServRefTySummaGen.Free;
    if Assigned(FtechCondServRefTySummaVat) then
      techCondServRefTySummaVat.Free;
    if Assigned(FtechCondServRefTyServicesSumma) then
      techCondServRefTyServicesSumma.Free;
    if Assigned(FtechCondServRefTyServicesPower) then
      techCondServRefTyServicesPower.Free;
    if Assigned(FtechCondServRefDateEdit) then
      techCondServRefDateEdit.Free;
    if Assigned(FtechCondServRefContractDateFinal) then
      techCondServRefContractDateFinal.Free;
    inherited Destroy;
  end;

  destructor ENPriconnectionDataShortList.Destroy;
  var
    I: Integer;
  begin
    for I := 0 to Length(Flist)-1 do
     if Assigned(Flist[I]) then
       Flist[I].Free;
     SetLength(Flist, 0);
     inherited Destroy;
  end;



initialization

  RemClassRegistry.RegisterXSClass(ENPriconnectionData, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPriconnectionData');
  RemClassRegistry.RegisterXSClass(ENPriconnectionDataRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPriconnectionDataRef');
  RemClassRegistry.RegisterXSClass(ENPriconnectionDataFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPriconnectionDataFilter');
  RemClassRegistry.RegisterXSClass(ENPriconnectionDataShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPriconnectionDataShort');
  RemClassRegistry.RegisterXSClass(ENPriconnectionDataShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPriconnectionDataShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENPriconnectionDataShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENPriconnectionDataShort');

  InvRegistry.RegisterInterface(TypeInfo(ENPriconnectionDataControllerSoapPort), 'http://ksoe.org/ENPriconnectionDataController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENPriconnectionDataControllerSoapPort), 'http://ksoe.org/ENPriconnectionDataController/action/ENPriconnectionDataController.%operationName%');


end.

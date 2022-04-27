unit ENPriconData2TechServicesController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENTechConditionsServicesController
   ,ENSubstation04Controller
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

  ENPriconData2TechServices            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPriconData2TechServicesRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPriconData2TechServices = class(TRemotable)
  private
    Fcode : Integer;
    FpowerMaxCurrent : TXSDecimal;
    FpowerReserveCurrent : TXSDecimal;
    FcoeffUsage : TXSDecimal;
    FpriceCurrent : TXSDecimal;
    FpowerContractTotal : TXSDecimal;
    FpowerContractByt : TXSDecimal;
    FpowerContractProm : TXSDecimal;
    FpowerContractTU : TXSDecimal;
    FcountCustomer : Integer;
    FcountCustomerByt : Integer;
    FcountCustomerProm : Integer;
    Ft1powerCurrent : TXSDecimal;
    Ft2powerCurrent : TXSDecimal;
    Ft3powerCurrent : TXSDecimal;
    FdateGen : TXSDate;
//???
    FtechCondServRef : ENTechConditionsServicesRef;
//???
    Fsubstation04Ref : ENSubstation04Ref;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property powerMaxCurrent : TXSDecimal read FpowerMaxCurrent write FpowerMaxCurrent;
    property powerReserveCurrent : TXSDecimal read FpowerReserveCurrent write FpowerReserveCurrent;
    property coeffUsage : TXSDecimal read FcoeffUsage write FcoeffUsage;
    property priceCurrent : TXSDecimal read FpriceCurrent write FpriceCurrent;
    property powerContractTotal : TXSDecimal read FpowerContractTotal write FpowerContractTotal;
    property powerContractByt : TXSDecimal read FpowerContractByt write FpowerContractByt;
    property powerContractProm : TXSDecimal read FpowerContractProm write FpowerContractProm;
    property powerContractTU : TXSDecimal read FpowerContractTU write FpowerContractTU;
    property  countCustomer : Integer read FcountCustomer write FcountCustomer;
    property  countCustomerByt : Integer read FcountCustomerByt write FcountCustomerByt;
    property  countCustomerProm : Integer read FcountCustomerProm write FcountCustomerProm;
    property t1powerCurrent : TXSDecimal read Ft1powerCurrent write Ft1powerCurrent;
    property t2powerCurrent : TXSDecimal read Ft2powerCurrent write Ft2powerCurrent;
    property t3powerCurrent : TXSDecimal read Ft3powerCurrent write Ft3powerCurrent;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property techCondServRef : ENTechConditionsServicesRef read FtechCondServRef write FtechCondServRef;
    property substation04Ref : ENSubstation04Ref read Fsubstation04Ref write Fsubstation04Ref;
  end;

{
  ENPriconData2TechServicesFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FpowerMaxCurrent : TXSDecimal;
    FpowerReserveCurrent : TXSDecimal;
    FcoeffUsage : TXSDecimal;
    FpriceCurrent : TXSDecimal;
    FpowerContractTotal : TXSDecimal;
    FpowerContractByt : TXSDecimal;
    FpowerContractProm : TXSDecimal;
    FpowerContractTU : TXSDecimal;
    FcountCustomer : Integer;
    FcountCustomerByt : Integer;
    FcountCustomerProm : Integer;
    Ft1powerCurrent : TXSDecimal;
    Ft2powerCurrent : TXSDecimal;
    Ft3powerCurrent : TXSDecimal;
    FdateGen : TXSDate;
//???
    FtechCondServRef : ENTechConditionsServicesRef;
//???
    Fsubstation04Ref : ENSubstation04Ref;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property powerMaxCurrent : TXSDecimal read FpowerMaxCurrent write FpowerMaxCurrent;
    property powerReserveCurrent : TXSDecimal read FpowerReserveCurrent write FpowerReserveCurrent;
    property coeffUsage : TXSDecimal read FcoeffUsage write FcoeffUsage;
    property priceCurrent : TXSDecimal read FpriceCurrent write FpriceCurrent;
    property powerContractTotal : TXSDecimal read FpowerContractTotal write FpowerContractTotal;
    property powerContractByt : TXSDecimal read FpowerContractByt write FpowerContractByt;
    property powerContractProm : TXSDecimal read FpowerContractProm write FpowerContractProm;
    property powerContractTU : TXSDecimal read FpowerContractTU write FpowerContractTU;
    property  countCustomer : Integer read FcountCustomer write FcountCustomer;
    property  countCustomerByt : Integer read FcountCustomerByt write FcountCustomerByt;
    property  countCustomerProm : Integer read FcountCustomerProm write FcountCustomerProm;
    property t1powerCurrent : TXSDecimal read Ft1powerCurrent write Ft1powerCurrent;
    property t2powerCurrent : TXSDecimal read Ft2powerCurrent write Ft2powerCurrent;
    property t3powerCurrent : TXSDecimal read Ft3powerCurrent write Ft3powerCurrent;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property techCondServRef : ENTechConditionsServicesRef read FtechCondServRef write FtechCondServRef;
    property substation04Ref : ENSubstation04Ref read Fsubstation04Ref write Fsubstation04Ref;
  end;
}

  ENPriconData2TechServicesFilter = class(ENPriconData2TechServices)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENPriconData2TechServicesShort = class(TRemotable)
  private
    Fcode : Integer;
    FpowerMaxCurrent : TXSDecimal;
    FpowerReserveCurrent : TXSDecimal;
    FcoeffUsage : TXSDecimal;
    FpriceCurrent : TXSDecimal;
    FpowerContractTotal : TXSDecimal;
    FpowerContractByt : TXSDecimal;
    FpowerContractProm : TXSDecimal;
    FpowerContractTU : TXSDecimal;
    FcountCustomer : Integer;
    FcountCustomerByt : Integer;
    FcountCustomerProm : Integer;
    Ft1powerCurrent : TXSDecimal;
    Ft2powerCurrent : TXSDecimal;
    Ft3powerCurrent : TXSDecimal;
    FdateGen : TXSDate;
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
    Fsubstation04RefCode : Integer;
    Fsubstation04RefName : WideString;
    Fsubstation04RefBuhName : WideString;
    Fsubstation04RefInvNumber : WideString;
    Fsubstation04RefNominalPower : TXSDecimal;
    Fsubstation04RefLastRepairDate : TXSDate;
    Fsubstation04RefSizCode : Integer;
    Fsubstation04RefAddress : WideString;
    Fsubstation04RefYearBuild : Integer;
    Fsubstation04RefYearWorkingStart : Integer;
    Fsubstation04RefChambersQuantity : Integer;
    Fsubstation04RefPeriodInspect : Integer;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property powerMaxCurrent : TXSDecimal read FpowerMaxCurrent write FpowerMaxCurrent;
    property powerReserveCurrent : TXSDecimal read FpowerReserveCurrent write FpowerReserveCurrent;
    property coeffUsage : TXSDecimal read FcoeffUsage write FcoeffUsage;
    property priceCurrent : TXSDecimal read FpriceCurrent write FpriceCurrent;
    property powerContractTotal : TXSDecimal read FpowerContractTotal write FpowerContractTotal;
    property powerContractByt : TXSDecimal read FpowerContractByt write FpowerContractByt;
    property powerContractProm : TXSDecimal read FpowerContractProm write FpowerContractProm;
    property powerContractTU : TXSDecimal read FpowerContractTU write FpowerContractTU;
    property  countCustomer : Integer read FcountCustomer write FcountCustomer;
    property  countCustomerByt : Integer read FcountCustomerByt write FcountCustomerByt;
    property  countCustomerProm : Integer read FcountCustomerProm write FcountCustomerProm;
    property t1powerCurrent : TXSDecimal read Ft1powerCurrent write Ft1powerCurrent;
    property t2powerCurrent : TXSDecimal read Ft2powerCurrent write Ft2powerCurrent;
    property t3powerCurrent : TXSDecimal read Ft3powerCurrent write Ft3powerCurrent;
    property dateGen : TXSDate read FdateGen write FdateGen;

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
    property substation04RefCode : Integer read Fsubstation04RefCode write Fsubstation04RefCode;
    property substation04RefName : WideString read Fsubstation04RefName write Fsubstation04RefName;
    property substation04RefBuhName : WideString read Fsubstation04RefBuhName write Fsubstation04RefBuhName;
    property substation04RefInvNumber : WideString read Fsubstation04RefInvNumber write Fsubstation04RefInvNumber;
    property substation04RefNominalPower : TXSDecimal read Fsubstation04RefNominalPower write Fsubstation04RefNominalPower;
    property substation04RefLastRepairDate : TXSDate read Fsubstation04RefLastRepairDate write Fsubstation04RefLastRepairDate;
    property substation04RefSizCode : Integer read Fsubstation04RefSizCode write Fsubstation04RefSizCode;
    property substation04RefAddress : WideString read Fsubstation04RefAddress write Fsubstation04RefAddress;
    property substation04RefYearBuild : Integer read Fsubstation04RefYearBuild write Fsubstation04RefYearBuild;
    property substation04RefYearWorkingStart : Integer read Fsubstation04RefYearWorkingStart write Fsubstation04RefYearWorkingStart;
    property substation04RefChambersQuantity : Integer read Fsubstation04RefChambersQuantity write Fsubstation04RefChambersQuantity;
    property substation04RefPeriodInspect : Integer read Fsubstation04RefPeriodInspect write Fsubstation04RefPeriodInspect;
  end;

  ArrayOfENPriconData2TechServicesShort = array of ENPriconData2TechServicesShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENPriconData2TechServicesShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENPriconData2TechServicesShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENPriconData2TechServicesShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENPriconData2TechServicesController/message/
  // soapAction: http://ksoe.org/ENPriconData2TechServicesController/action/ENPriconData2TechServicesController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENPriconData2TechServicesControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENPriconData2TechServicesController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENPriconData2TechServicesControllerSoapPort = interface(IInvokable)
  ['{0848F8EF-F7B7-40BE-B908-5B971C6374B2}']
    function add(const aENPriconData2TechServices: ENPriconData2TechServices): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENPriconData2TechServices: ENPriconData2TechServices); stdcall;
    function getObject(const anObjectCode: Integer): ENPriconData2TechServices; stdcall;
    function getList: ENPriconData2TechServicesShortList; stdcall;
    function getFilteredList(const aENPriconData2TechServicesFilter: ENPriconData2TechServicesFilter): ENPriconData2TechServicesShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENPriconData2TechServicesShortList; stdcall;
    function getScrollableFilteredList(const aENPriconData2TechServicesFilter: ENPriconData2TechServicesFilter; const aFromPosition: Integer; const aQuantity: Integer): ENPriconData2TechServicesShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENPriconData2TechServicesShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENPriconData2TechServicesFilter: ENPriconData2TechServicesFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENPriconData2TechServicesShort; stdcall;
  end;


implementation

  destructor ENPriconData2TechServices.Destroy;
  begin
    if Assigned(FpowerMaxCurrent) then
      powerMaxCurrent.Free;
    if Assigned(FpowerReserveCurrent) then
      powerReserveCurrent.Free;
    if Assigned(FcoeffUsage) then
      coeffUsage.Free;
    if Assigned(FpriceCurrent) then
      priceCurrent.Free;
    if Assigned(FpowerContractTotal) then
      powerContractTotal.Free;
    if Assigned(FpowerContractByt) then
      powerContractByt.Free;
    if Assigned(FpowerContractProm) then
      powerContractProm.Free;
    if Assigned(FpowerContractTU) then
      powerContractTU.Free;
    if Assigned(Ft1powerCurrent) then
      t1powerCurrent.Free;
    if Assigned(Ft2powerCurrent) then
      t2powerCurrent.Free;
    if Assigned(Ft3powerCurrent) then
      t3powerCurrent.Free;
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FtechCondServRef) then
      techCondServRef.Free;
    if Assigned(Fsubstation04Ref) then
      substation04Ref.Free;
    inherited Destroy;
  end;

{
  destructor ENPriconData2TechServicesFilter.Destroy;
  begin
    if Assigned(FpowerMaxCurrent) then
      powerMaxCurrent.Free;
    if Assigned(FpowerReserveCurrent) then
      powerReserveCurrent.Free;
    if Assigned(FcoeffUsage) then
      coeffUsage.Free;
    if Assigned(FpriceCurrent) then
      priceCurrent.Free;
    if Assigned(FpowerContractTotal) then
      powerContractTotal.Free;
    if Assigned(FpowerContractByt) then
      powerContractByt.Free;
    if Assigned(FpowerContractProm) then
      powerContractProm.Free;
    if Assigned(FpowerContractTU) then
      powerContractTU.Free;
    if Assigned(Ft1powerCurrent) then
      t1powerCurrent.Free;
    if Assigned(Ft2powerCurrent) then
      t2powerCurrent.Free;
    if Assigned(Ft3powerCurrent) then
      t3powerCurrent.Free;
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FtechCondServRef) then
      techCondServRef.Free;
    if Assigned(Fsubstation04Ref) then
      substation04Ref.Free;
    inherited Destroy;
  end;
}

  destructor ENPriconData2TechServicesFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENPriconData2TechServicesShort.Destroy;
  begin
    if Assigned(FpowerMaxCurrent) then
      powerMaxCurrent.Free;
    if Assigned(FpowerReserveCurrent) then
      powerReserveCurrent.Free;
    if Assigned(FcoeffUsage) then
      coeffUsage.Free;
    if Assigned(FpriceCurrent) then
      priceCurrent.Free;
    if Assigned(FpowerContractTotal) then
      powerContractTotal.Free;
    if Assigned(FpowerContractByt) then
      powerContractByt.Free;
    if Assigned(FpowerContractProm) then
      powerContractProm.Free;
    if Assigned(FpowerContractTU) then
      powerContractTU.Free;
    if Assigned(Ft1powerCurrent) then
      t1powerCurrent.Free;
    if Assigned(Ft2powerCurrent) then
      t2powerCurrent.Free;
    if Assigned(Ft3powerCurrent) then
      t3powerCurrent.Free;
    if Assigned(FdateGen) then
      dateGen.Free;
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
    if Assigned(Fsubstation04RefNominalPower) then
      substation04RefNominalPower.Free;
    if Assigned(Fsubstation04RefLastRepairDate) then
      substation04RefLastRepairDate.Free;
    inherited Destroy;
  end;

  destructor ENPriconData2TechServicesShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENPriconData2TechServices, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPriconData2TechServices');
  RemClassRegistry.RegisterXSClass(ENPriconData2TechServicesRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPriconData2TechServicesRef');
  RemClassRegistry.RegisterXSClass(ENPriconData2TechServicesFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPriconData2TechServicesFilter');
  RemClassRegistry.RegisterXSClass(ENPriconData2TechServicesShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPriconData2TechServicesShort');
  RemClassRegistry.RegisterXSClass(ENPriconData2TechServicesShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPriconData2TechServicesShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENPriconData2TechServicesShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENPriconData2TechServicesShort');

  InvRegistry.RegisterInterface(TypeInfo(ENPriconData2TechServicesControllerSoapPort), 'http://ksoe.org/ENPriconData2TechServicesController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENPriconData2TechServicesControllerSoapPort), 'http://ksoe.org/ENPriconData2TechServicesController/action/ENPriconData2TechServicesController.%operationName%');


end.

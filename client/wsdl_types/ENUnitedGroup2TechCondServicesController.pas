unit ENUnitedGroup2TechCondServicesController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENTechConditionsServicesController
   ,ENUnitedGroupConnectionsController
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

  ENUnitedGroup2TechCondServices            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENUnitedGroup2TechCondServicesRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENUnitedGroup2TechCondServices = class(TRemotable)
  private
    Fcode : Integer;
    FcostLines04Building : TXSDecimal;
    FcostLines04Building1 : TXSDecimal;
    FcostLines04Building2 : TXSDecimal;
    FcostLines04Building3 : TXSDecimal;
    FcostLines10Building : TXSDecimal;
    FcostLines10Building1 : TXSDecimal;
    FcostLines10Building2 : TXSDecimal;
    FcostLines10Building3 : TXSDecimal;
    FcostLines10Building4 : TXSDecimal;
//???
    FtechCondServRef : ENTechConditionsServicesRef;
//???
    FunitedGroupL04D1Ref : ENUnitedGroupConnectionsRef;
//???
    FunitedGroupL04D2Ref : ENUnitedGroupConnectionsRef;
//???
    FunitedGroupL04D3Ref : ENUnitedGroupConnectionsRef;
//???
    FunitedGroupTP04Ref : ENUnitedGroupConnectionsRef;
//???
    FunitedGroupL10D1Ref : ENUnitedGroupConnectionsRef;
//???
    FunitedGroupL10D2Ref : ENUnitedGroupConnectionsRef;
//???
    FunitedGroupL10D3Ref : ENUnitedGroupConnectionsRef;
//???
    FunitedGroupL10D4Ref : ENUnitedGroupConnectionsRef;
//???
    FunitedGroupPS35Ref : ENUnitedGroupConnectionsRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property costLines04Building : TXSDecimal read FcostLines04Building write FcostLines04Building;
    property costLines04Building1 : TXSDecimal read FcostLines04Building1 write FcostLines04Building1;
    property costLines04Building2 : TXSDecimal read FcostLines04Building2 write FcostLines04Building2;
    property costLines04Building3 : TXSDecimal read FcostLines04Building3 write FcostLines04Building3;
    property costLines10Building : TXSDecimal read FcostLines10Building write FcostLines10Building;
    property costLines10Building1 : TXSDecimal read FcostLines10Building1 write FcostLines10Building1;
    property costLines10Building2 : TXSDecimal read FcostLines10Building2 write FcostLines10Building2;
    property costLines10Building3 : TXSDecimal read FcostLines10Building3 write FcostLines10Building3;
    property costLines10Building4 : TXSDecimal read FcostLines10Building4 write FcostLines10Building4;
    property techCondServRef : ENTechConditionsServicesRef read FtechCondServRef write FtechCondServRef;
    property unitedGroupL04D1Ref : ENUnitedGroupConnectionsRef read FunitedGroupL04D1Ref write FunitedGroupL04D1Ref;
    property unitedGroupL04D2Ref : ENUnitedGroupConnectionsRef read FunitedGroupL04D2Ref write FunitedGroupL04D2Ref;
    property unitedGroupL04D3Ref : ENUnitedGroupConnectionsRef read FunitedGroupL04D3Ref write FunitedGroupL04D3Ref;
    property unitedGroupTP04Ref : ENUnitedGroupConnectionsRef read FunitedGroupTP04Ref write FunitedGroupTP04Ref;
    property unitedGroupL10D1Ref : ENUnitedGroupConnectionsRef read FunitedGroupL10D1Ref write FunitedGroupL10D1Ref;
    property unitedGroupL10D2Ref : ENUnitedGroupConnectionsRef read FunitedGroupL10D2Ref write FunitedGroupL10D2Ref;
    property unitedGroupL10D3Ref : ENUnitedGroupConnectionsRef read FunitedGroupL10D3Ref write FunitedGroupL10D3Ref;
    property unitedGroupL10D4Ref : ENUnitedGroupConnectionsRef read FunitedGroupL10D4Ref write FunitedGroupL10D4Ref;
    property unitedGroupPS35Ref : ENUnitedGroupConnectionsRef read FunitedGroupPS35Ref write FunitedGroupPS35Ref;
  end;

{
  ENUnitedGroup2TechCondServicesFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FcostLines04Building : TXSDecimal;
    FcostLines04Building1 : TXSDecimal;
    FcostLines04Building2 : TXSDecimal;
    FcostLines04Building3 : TXSDecimal;
    FcostLines10Building : TXSDecimal;
    FcostLines10Building1 : TXSDecimal;
    FcostLines10Building2 : TXSDecimal;
    FcostLines10Building3 : TXSDecimal;
    FcostLines10Building4 : TXSDecimal;
//???
    FtechCondServRef : ENTechConditionsServicesRef;
//???
    FunitedGroupL04D1Ref : ENUnitedGroupConnectionsRef;
//???
    FunitedGroupL04D2Ref : ENUnitedGroupConnectionsRef;
//???
    FunitedGroupL04D3Ref : ENUnitedGroupConnectionsRef;
//???
    FunitedGroupTP04Ref : ENUnitedGroupConnectionsRef;
//???
    FunitedGroupL10D1Ref : ENUnitedGroupConnectionsRef;
//???
    FunitedGroupL10D2Ref : ENUnitedGroupConnectionsRef;
//???
    FunitedGroupL10D3Ref : ENUnitedGroupConnectionsRef;
//???
    FunitedGroupL10D4Ref : ENUnitedGroupConnectionsRef;
//???
    FunitedGroupPS35Ref : ENUnitedGroupConnectionsRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property costLines04Building : TXSDecimal read FcostLines04Building write FcostLines04Building;
    property costLines04Building1 : TXSDecimal read FcostLines04Building1 write FcostLines04Building1;
    property costLines04Building2 : TXSDecimal read FcostLines04Building2 write FcostLines04Building2;
    property costLines04Building3 : TXSDecimal read FcostLines04Building3 write FcostLines04Building3;
    property costLines10Building : TXSDecimal read FcostLines10Building write FcostLines10Building;
    property costLines10Building1 : TXSDecimal read FcostLines10Building1 write FcostLines10Building1;
    property costLines10Building2 : TXSDecimal read FcostLines10Building2 write FcostLines10Building2;
    property costLines10Building3 : TXSDecimal read FcostLines10Building3 write FcostLines10Building3;
    property costLines10Building4 : TXSDecimal read FcostLines10Building4 write FcostLines10Building4;
    property techCondServRef : ENTechConditionsServicesRef read FtechCondServRef write FtechCondServRef;
    property unitedGroupL04D1Ref : ENUnitedGroupConnectionsRef read FunitedGroupL04D1Ref write FunitedGroupL04D1Ref;
    property unitedGroupL04D2Ref : ENUnitedGroupConnectionsRef read FunitedGroupL04D2Ref write FunitedGroupL04D2Ref;
    property unitedGroupL04D3Ref : ENUnitedGroupConnectionsRef read FunitedGroupL04D3Ref write FunitedGroupL04D3Ref;
    property unitedGroupTP04Ref : ENUnitedGroupConnectionsRef read FunitedGroupTP04Ref write FunitedGroupTP04Ref;
    property unitedGroupL10D1Ref : ENUnitedGroupConnectionsRef read FunitedGroupL10D1Ref write FunitedGroupL10D1Ref;
    property unitedGroupL10D2Ref : ENUnitedGroupConnectionsRef read FunitedGroupL10D2Ref write FunitedGroupL10D2Ref;
    property unitedGroupL10D3Ref : ENUnitedGroupConnectionsRef read FunitedGroupL10D3Ref write FunitedGroupL10D3Ref;
    property unitedGroupL10D4Ref : ENUnitedGroupConnectionsRef read FunitedGroupL10D4Ref write FunitedGroupL10D4Ref;
    property unitedGroupPS35Ref : ENUnitedGroupConnectionsRef read FunitedGroupPS35Ref write FunitedGroupPS35Ref;
  end;
}

  ENUnitedGroup2TechCondServicesFilter = class(ENUnitedGroup2TechCondServices)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENUnitedGroup2TechCondServicesShort = class(TRemotable)
  private
    Fcode : Integer;
    FcostLines04Building : TXSDecimal;
    FcostLines04Building1 : TXSDecimal;
    FcostLines04Building2 : TXSDecimal;
    FcostLines04Building3 : TXSDecimal;
    FcostLines10Building : TXSDecimal;
    FcostLines10Building1 : TXSDecimal;
    FcostLines10Building2 : TXSDecimal;
    FcostLines10Building3 : TXSDecimal;
    FcostLines10Building4 : TXSDecimal;
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
    FtechCondServRefBaseStation : Integer;
    FtechCondServRefSmallArchFrm : Integer;
    FtechCondServRefContractDateFinal : TXSDate;
    FtechCondServRefIsSea : Integer;
    FunitedGroupL04D1RefCode : Integer;
    FunitedGroupL04D1RefName : WideString;
    FunitedGroupL04D1RefDescription : WideString;
    FunitedGroupL04D2RefCode : Integer;
    FunitedGroupL04D2RefName : WideString;
    FunitedGroupL04D2RefDescription : WideString;
    FunitedGroupL04D3RefCode : Integer;
    FunitedGroupL04D3RefName : WideString;
    FunitedGroupL04D3RefDescription : WideString;
    FunitedGroupTP04RefCode : Integer;
    FunitedGroupTP04RefName : WideString;
    FunitedGroupTP04RefDescription : WideString;
    FunitedGroupL10D1RefCode : Integer;
    FunitedGroupL10D1RefName : WideString;
    FunitedGroupL10D1RefDescription : WideString;
    FunitedGroupL10D2RefCode : Integer;
    FunitedGroupL10D2RefName : WideString;
    FunitedGroupL10D2RefDescription : WideString;
    FunitedGroupL10D3RefCode : Integer;
    FunitedGroupL10D3RefName : WideString;
    FunitedGroupL10D3RefDescription : WideString;
    FunitedGroupL10D4RefCode : Integer;
    FunitedGroupL10D4RefName : WideString;
    FunitedGroupL10D4RefDescription : WideString;
    FunitedGroupPS35RefCode : Integer;
    FunitedGroupPS35RefName : WideString;
    FunitedGroupPS35RefDescription : WideString;

    //////////////////////////////
    Fline04Code : Integer;
    Fline04InvNumber : WideString;
    Fline04Name : WideString;
    Ftp04Code : Integer;
    Ftp04InvNumber : WideString;
    Ftp04Name : WideString;
    Fline10Code : Integer;
    Fline10invnumber : WideString;
    Fline10Name : WideString;
    Fpc35Code : Integer;
    Fpc35InvNumber : WideString;
    Fpc35Name : WideString;
    FpaySum : TXSDecimal;

    FtechCondServRefCnSubsystemRefCode : Integer;
    FtechCondServRefCnSubsystemRefName : WideString;
    //////////////////////////////
    
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property costLines04Building : TXSDecimal read FcostLines04Building write FcostLines04Building;
    property costLines04Building1 : TXSDecimal read FcostLines04Building1 write FcostLines04Building1;
    property costLines04Building2 : TXSDecimal read FcostLines04Building2 write FcostLines04Building2;
    property costLines04Building3 : TXSDecimal read FcostLines04Building3 write FcostLines04Building3;
    property costLines10Building : TXSDecimal read FcostLines10Building write FcostLines10Building;
    property costLines10Building1 : TXSDecimal read FcostLines10Building1 write FcostLines10Building1;
    property costLines10Building2 : TXSDecimal read FcostLines10Building2 write FcostLines10Building2;
    property costLines10Building3 : TXSDecimal read FcostLines10Building3 write FcostLines10Building3;
    property costLines10Building4 : TXSDecimal read FcostLines10Building4 write FcostLines10Building4;

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
    property techCondServRefBaseStation : Integer read FtechCondServRefBaseStation write FtechCondServRefBaseStation;
    property techCondServRefSmallArchFrm : Integer read FtechCondServRefSmallArchFrm write FtechCondServRefSmallArchFrm;
    property techCondServRefContractDateFinal : TXSDate read FtechCondServRefContractDateFinal write FtechCondServRefContractDateFinal;
    property techCondServRefIsSea : Integer read FtechCondServRefIsSea write FtechCondServRefIsSea;
    property unitedGroupL04D1RefCode : Integer read FunitedGroupL04D1RefCode write FunitedGroupL04D1RefCode;
    property unitedGroupL04D1RefName : WideString read FunitedGroupL04D1RefName write FunitedGroupL04D1RefName;
    property unitedGroupL04D1RefDescription : WideString read FunitedGroupL04D1RefDescription write FunitedGroupL04D1RefDescription;
    property unitedGroupL04D2RefCode : Integer read FunitedGroupL04D2RefCode write FunitedGroupL04D2RefCode;
    property unitedGroupL04D2RefName : WideString read FunitedGroupL04D2RefName write FunitedGroupL04D2RefName;
    property unitedGroupL04D2RefDescription : WideString read FunitedGroupL04D2RefDescription write FunitedGroupL04D2RefDescription;
    property unitedGroupL04D3RefCode : Integer read FunitedGroupL04D3RefCode write FunitedGroupL04D3RefCode;
    property unitedGroupL04D3RefName : WideString read FunitedGroupL04D3RefName write FunitedGroupL04D3RefName;
    property unitedGroupL04D3RefDescription : WideString read FunitedGroupL04D3RefDescription write FunitedGroupL04D3RefDescription;
    property unitedGroupTP04RefCode : Integer read FunitedGroupTP04RefCode write FunitedGroupTP04RefCode;
    property unitedGroupTP04RefName : WideString read FunitedGroupTP04RefName write FunitedGroupTP04RefName;
    property unitedGroupTP04RefDescription : WideString read FunitedGroupTP04RefDescription write FunitedGroupTP04RefDescription;
    property unitedGroupL10D1RefCode : Integer read FunitedGroupL10D1RefCode write FunitedGroupL10D1RefCode;
    property unitedGroupL10D1RefName : WideString read FunitedGroupL10D1RefName write FunitedGroupL10D1RefName;
    property unitedGroupL10D1RefDescription : WideString read FunitedGroupL10D1RefDescription write FunitedGroupL10D1RefDescription;
    property unitedGroupL10D2RefCode : Integer read FunitedGroupL10D2RefCode write FunitedGroupL10D2RefCode;
    property unitedGroupL10D2RefName : WideString read FunitedGroupL10D2RefName write FunitedGroupL10D2RefName;
    property unitedGroupL10D2RefDescription : WideString read FunitedGroupL10D2RefDescription write FunitedGroupL10D2RefDescription;
    property unitedGroupL10D3RefCode : Integer read FunitedGroupL10D3RefCode write FunitedGroupL10D3RefCode;
    property unitedGroupL10D3RefName : WideString read FunitedGroupL10D3RefName write FunitedGroupL10D3RefName;
    property unitedGroupL10D3RefDescription : WideString read FunitedGroupL10D3RefDescription write FunitedGroupL10D3RefDescription;
    property unitedGroupL10D4RefCode : Integer read FunitedGroupL10D4RefCode write FunitedGroupL10D4RefCode;
    property unitedGroupL10D4RefName : WideString read FunitedGroupL10D4RefName write FunitedGroupL10D4RefName;
    property unitedGroupL10D4RefDescription : WideString read FunitedGroupL10D4RefDescription write FunitedGroupL10D4RefDescription;
    property unitedGroupPS35RefCode : Integer read FunitedGroupPS35RefCode write FunitedGroupPS35RefCode;
    property unitedGroupPS35RefName : WideString read FunitedGroupPS35RefName write FunitedGroupPS35RefName;
    property unitedGroupPS35RefDescription : WideString read FunitedGroupPS35RefDescription write FunitedGroupPS35RefDescription;

    property line04Code : Integer read Fline04Code write Fline04Code;
    property line04InvNumber : WideString read Fline04InvNumber write Fline04InvNumber;
    property line04Name : WideString read Fline04Name write Fline04Name;
    property tp04Code : Integer read Ftp04Code write Ftp04Code;
    property tp04InvNumber : WideString read Ftp04InvNumber write Ftp04InvNumber;
    property tp04Name : WideString read Ftp04Name write Ftp04Name;
    property line10Code : Integer read Fline10Code write Fline10Code;
    property line10invnumber : WideString read Fline10invnumber write Fline10invnumber;
    property line10Name : WideString read Fline10Name write Fline10Name;
    property pc35Code : Integer read Fpc35Code write Fpc35Code;
    property pc35InvNumber : WideString read Fpc35InvNumber write Fpc35InvNumber;
    property pc35Name : WideString read Fpc35Name write Fpc35Name;
    property paySum : TXSDecimal read FpaySum write FpaySum;

    property techCondServRefCnSubsystemRefCode : Integer read FtechCondServRefCnSubsystemRefCode write FtechCondServRefCnSubsystemRefCode;
    property techCondServRefCnSubsystemRefName : WideString read FtechCondServRefCnSubsystemRefName write FtechCondServRefCnSubsystemRefName;
  end;

  ArrayOfENUnitedGroup2TechCondServicesShort = array of ENUnitedGroup2TechCondServicesShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENUnitedGroup2TechCondServicesShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENUnitedGroup2TechCondServicesShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENUnitedGroup2TechCondServicesShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENUnitedGroup2TechCondServicesController/message/
  // soapAction: http://ksoe.org/ENUnitedGroup2TechCondServicesController/action/ENUnitedGroup2TechCondServicesController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENUnitedGroup2TechCondServicesControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENUnitedGroup2TechCondServicesController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENUnitedGroup2TechCondServicesControllerSoapPort = interface(IInvokable)
  ['{FC880798-D17C-4023-AACF-9F305032E85B}']
    function add(const aENUnitedGroup2TechCondServices: ENUnitedGroup2TechCondServices): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENUnitedGroup2TechCondServices: ENUnitedGroup2TechCondServices); stdcall;
    function getObject(const anObjectCode: Integer): ENUnitedGroup2TechCondServices; stdcall;
    function getList: ENUnitedGroup2TechCondServicesShortList; stdcall;
    function getFilteredList(const aENUnitedGroup2TechCondServicesFilter: ENUnitedGroup2TechCondServicesFilter): ENUnitedGroup2TechCondServicesShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENUnitedGroup2TechCondServicesShortList; stdcall;
    function getScrollableFilteredList(const aENUnitedGroup2TechCondServicesFilter: ENUnitedGroup2TechCondServicesFilter; const aFromPosition: Integer; const aQuantity: Integer): ENUnitedGroup2TechCondServicesShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENUnitedGroup2TechCondServicesShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENUnitedGroup2TechCondServicesFilter: ENUnitedGroup2TechCondServicesFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENUnitedGroup2TechCondServicesShort; stdcall;
    procedure saveUnitedGroup2TcsItems(const aENUnitedGroup2TechCondServicesShort: ArrayOfENUnitedGroup2TechCondServicesShort); stdcall;
    
    function getENLine04ListByTechCondServices(const aTechCondServicesCode: Integer): ENUnitedGroup2TechCondServicesShortList; stdcall;
    function getENSubstation04ListByTechCondServices(const aTechCondServicesCode: Integer): ENUnitedGroup2TechCondServicesShortList; stdcall;
    function getENLine10ListByTechCondServices(const aTechCondServicesCode: Integer): ENUnitedGroup2TechCondServicesShortList; stdcall;
    function getENSubstation35ListByTechCondServices(const aTechCondServicesCode: Integer): ENUnitedGroup2TechCondServicesShortList; stdcall;    
  end;


implementation

  destructor ENUnitedGroup2TechCondServices.Destroy;
  begin
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
    if Assigned(FtechCondServRef) then
      techCondServRef.Free;
    if Assigned(FunitedGroupL04D1Ref) then
      unitedGroupL04D1Ref.Free;
    if Assigned(FunitedGroupL04D2Ref) then
      unitedGroupL04D2Ref.Free;
    if Assigned(FunitedGroupL04D3Ref) then
      unitedGroupL04D3Ref.Free;
    if Assigned(FunitedGroupTP04Ref) then
      unitedGroupTP04Ref.Free;
    if Assigned(FunitedGroupL10D1Ref) then
      unitedGroupL10D1Ref.Free;
    if Assigned(FunitedGroupL10D2Ref) then
      unitedGroupL10D2Ref.Free;
    if Assigned(FunitedGroupL10D3Ref) then
      unitedGroupL10D3Ref.Free;
    if Assigned(FunitedGroupL10D4Ref) then
      unitedGroupL10D4Ref.Free;
    if Assigned(FunitedGroupPS35Ref) then
      unitedGroupPS35Ref.Free;
    inherited Destroy;
  end;

{
  destructor ENUnitedGroup2TechCondServicesFilter.Destroy;
  begin
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
    if Assigned(FtechCondServRef) then
      techCondServRef.Free;
    if Assigned(FunitedGroupL04D1Ref) then
      unitedGroupL04D1Ref.Free;
    if Assigned(FunitedGroupL04D2Ref) then
      unitedGroupL04D2Ref.Free;
    if Assigned(FunitedGroupL04D3Ref) then
      unitedGroupL04D3Ref.Free;
    if Assigned(FunitedGroupTP04Ref) then
      unitedGroupTP04Ref.Free;
    if Assigned(FunitedGroupL10D1Ref) then
      unitedGroupL10D1Ref.Free;
    if Assigned(FunitedGroupL10D2Ref) then
      unitedGroupL10D2Ref.Free;
    if Assigned(FunitedGroupL10D3Ref) then
      unitedGroupL10D3Ref.Free;
    if Assigned(FunitedGroupL10D4Ref) then
      unitedGroupL10D4Ref.Free;
    if Assigned(FunitedGroupPS35Ref) then
      unitedGroupPS35Ref.Free;
    inherited Destroy;
  end;
}

  destructor ENUnitedGroup2TechCondServicesFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENUnitedGroup2TechCondServicesShort.Destroy;
  begin
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

  destructor ENUnitedGroup2TechCondServicesShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENUnitedGroup2TechCondServices, 'http://ksoe.org/EnergyproControllerService/type/', 'ENUnitedGroup2TechCondServices');
  RemClassRegistry.RegisterXSClass(ENUnitedGroup2TechCondServicesRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENUnitedGroup2TechCondServicesRef');
  RemClassRegistry.RegisterXSClass(ENUnitedGroup2TechCondServicesFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENUnitedGroup2TechCondServicesFilter');
  RemClassRegistry.RegisterXSClass(ENUnitedGroup2TechCondServicesShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENUnitedGroup2TechCondServicesShort');
  RemClassRegistry.RegisterXSClass(ENUnitedGroup2TechCondServicesShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENUnitedGroup2TechCondServicesShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENUnitedGroup2TechCondServicesShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENUnitedGroup2TechCondServicesShort');

  InvRegistry.RegisterInterface(TypeInfo(ENUnitedGroup2TechCondServicesControllerSoapPort), 'http://ksoe.org/ENUnitedGroup2TechCondServicesController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENUnitedGroup2TechCondServicesControllerSoapPort), 'http://ksoe.org/ENUnitedGroup2TechCondServicesController/action/ENUnitedGroup2TechCondServicesController.%operationName%');


end.

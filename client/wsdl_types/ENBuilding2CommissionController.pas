unit ENBuilding2CommissionController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENBuildingController
   ,ENBuildingCommissionTypeController
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

  ENBuilding2Commission            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENBuilding2CommissionRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENBuilding2Commission = class(TRemotable)
  private
    Fcode : Integer;
    FtabNumber : WideString;
    FFIO : WideString;
    FshortFIO : WideString;
    FpositionName : WideString;
//???
    FENBuildingRef : ENBuildingRef;
//???
    FENBuildingCommissionTypeRef : ENBuildingCommissionTypeRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property tabNumber : WideString read FtabNumber write FtabNumber;
    property FIO : WideString read FFIO write FFIO;
    property shortFIO : WideString read FshortFIO write FshortFIO;
    property positionName : WideString read FpositionName write FpositionName;
    property ENBuildingRef : ENBuildingRef read FENBuildingRef write FENBuildingRef;
    property ENBuildingCommissionTypeRef : ENBuildingCommissionTypeRef read FENBuildingCommissionTypeRef write FENBuildingCommissionTypeRef;
  end;

{
  ENBuilding2CommissionFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FtabNumber : WideString;
    FFIO : WideString;
    FshortFIO : WideString;
    FpositionName : WideString;
//???
    FENBuildingRef : ENBuildingRef;
//???
    FENBuildingCommissionTypeRef : ENBuildingCommissionTypeRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property tabNumber : WideString read FtabNumber write FtabNumber;
    property FIO : WideString read FFIO write FFIO;
    property shortFIO : WideString read FshortFIO write FshortFIO;
    property positionName : WideString read FpositionName write FpositionName;
    property ENBuildingRef : ENBuildingRef read FENBuildingRef write FENBuildingRef;
    property ENBuildingCommissionTypeRef : ENBuildingCommissionTypeRef read FENBuildingCommissionTypeRef write FENBuildingCommissionTypeRef;
  end;
}

  ENBuilding2CommissionFilter = class(ENBuilding2Commission)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENBuilding2CommissionShort = class(TRemotable)
  private
    Fcode : Integer;
    FtabNumber : WideString;
    FFIO : WideString;
    FshortFIO : WideString;
    FpositionName : WideString;
    FENBuildingRefCode : Integer;
    FENBuildingRefNumbergen : WideString;
    FENBuildingRefDateGen : TXSDate;
    FENBuildingRefDateEdit : TXSDate;
    FENBuildingRefSummaGen : TXSDecimal;
    FENBuildingRefSummaNDS : TXSDecimal;
    FENBuildingRefCharacteristic : WideString;
    FENBuildingRefExecutedPosition : WideString;
    FENBuildingRefExecutedName : WideString;
    FENBuildingRefAcceptedPosition : WideString;
    FENBuildingRefAcceptedName : WideString;
    FENBuildingRefContractPrice : TXSDecimal;
    FENBuildingRefCodeMol : WideString;
    FENBuildingRefCodePodr : WideString;
    FENBuildingRefInvNumberOZ : WideString;
    FENBuildingRefNameOZ : WideString;
    FENBuildingRefFinContractNumber : WideString;
    FENBuildingRefFinContractDate : TXSDate;
    FENBuildingRefPartnerName : WideString;
    FENBuildingRefPartnerCode : WideString;
    FENBuildingRefIsInvestProgram : Integer;
    FENBuildingRefYearInvestProgram : WideString;
    FENBuildingRefItemInvestProgram : WideString;
    FENBuildingRefBuildingAddress : WideString;
    FENBuildingRefDecreeNumber : WideString;
    FENBuildingRefDecreeDate : TXSDate;
    FENBuildingRefExploitationTerm : Integer;
    FENBuildingRefDateLoadExpl : TXSDate;
    FENBuildingRefDateBuild : TXSDate;
    FENBuildingRefUserGen : WideString;
    FENBuildingCommissionTypeRefCode : Integer;
    FENBuildingCommissionTypeRefName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property tabNumber : WideString read FtabNumber write FtabNumber;
    property FIO : WideString read FFIO write FFIO;
    property shortFIO : WideString read FshortFIO write FshortFIO;
    property positionName : WideString read FpositionName write FpositionName;

    property ENBuildingRefCode : Integer read FENBuildingRefCode write FENBuildingRefCode;
    property ENBuildingRefNumbergen : WideString read FENBuildingRefNumbergen write FENBuildingRefNumbergen;
    property ENBuildingRefDateGen : TXSDate read FENBuildingRefDateGen write FENBuildingRefDateGen;
    property ENBuildingRefDateEdit : TXSDate read FENBuildingRefDateEdit write FENBuildingRefDateEdit;
    property ENBuildingRefSummaGen : TXSDecimal read FENBuildingRefSummaGen write FENBuildingRefSummaGen;
    property ENBuildingRefSummaNDS : TXSDecimal read FENBuildingRefSummaNDS write FENBuildingRefSummaNDS;
    property ENBuildingRefCharacteristic : WideString read FENBuildingRefCharacteristic write FENBuildingRefCharacteristic;
    property ENBuildingRefExecutedPosition : WideString read FENBuildingRefExecutedPosition write FENBuildingRefExecutedPosition;
    property ENBuildingRefExecutedName : WideString read FENBuildingRefExecutedName write FENBuildingRefExecutedName;
    property ENBuildingRefAcceptedPosition : WideString read FENBuildingRefAcceptedPosition write FENBuildingRefAcceptedPosition;
    property ENBuildingRefAcceptedName : WideString read FENBuildingRefAcceptedName write FENBuildingRefAcceptedName;
    property ENBuildingRefContractPrice : TXSDecimal read FENBuildingRefContractPrice write FENBuildingRefContractPrice;
    property ENBuildingRefCodeMol : WideString read FENBuildingRefCodeMol write FENBuildingRefCodeMol;
    property ENBuildingRefCodePodr : WideString read FENBuildingRefCodePodr write FENBuildingRefCodePodr;
    property ENBuildingRefInvNumberOZ : WideString read FENBuildingRefInvNumberOZ write FENBuildingRefInvNumberOZ;
    property ENBuildingRefNameOZ : WideString read FENBuildingRefNameOZ write FENBuildingRefNameOZ;
    property ENBuildingRefFinContractNumber : WideString read FENBuildingRefFinContractNumber write FENBuildingRefFinContractNumber;
    property ENBuildingRefFinContractDate : TXSDate read FENBuildingRefFinContractDate write FENBuildingRefFinContractDate;
    property ENBuildingRefPartnerName : WideString read FENBuildingRefPartnerName write FENBuildingRefPartnerName;
    property ENBuildingRefPartnerCode : WideString read FENBuildingRefPartnerCode write FENBuildingRefPartnerCode;
    property ENBuildingRefIsInvestProgram : Integer read FENBuildingRefIsInvestProgram write FENBuildingRefIsInvestProgram;
    property ENBuildingRefYearInvestProgram : WideString read FENBuildingRefYearInvestProgram write FENBuildingRefYearInvestProgram;
    property ENBuildingRefItemInvestProgram : WideString read FENBuildingRefItemInvestProgram write FENBuildingRefItemInvestProgram;
    property ENBuildingRefBuildingAddress : WideString read FENBuildingRefBuildingAddress write FENBuildingRefBuildingAddress;
    property ENBuildingRefDecreeNumber : WideString read FENBuildingRefDecreeNumber write FENBuildingRefDecreeNumber;
    property ENBuildingRefDecreeDate : TXSDate read FENBuildingRefDecreeDate write FENBuildingRefDecreeDate;
    property ENBuildingRefExploitationTerm : Integer read FENBuildingRefExploitationTerm write FENBuildingRefExploitationTerm;
    property ENBuildingRefDateLoadExpl : TXSDate read FENBuildingRefDateLoadExpl write FENBuildingRefDateLoadExpl;
    property ENBuildingRefDateBuild : TXSDate read FENBuildingRefDateBuild write FENBuildingRefDateBuild;
    property ENBuildingRefUserGen : WideString read FENBuildingRefUserGen write FENBuildingRefUserGen;
    property ENBuildingCommissionTypeRefCode : Integer read FENBuildingCommissionTypeRefCode write FENBuildingCommissionTypeRefCode;
    property ENBuildingCommissionTypeRefName : WideString read FENBuildingCommissionTypeRefName write FENBuildingCommissionTypeRefName;
  end;

  ArrayOfENBuilding2CommissionShort = array of ENBuilding2CommissionShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENBuilding2CommissionShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENBuilding2CommissionShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENBuilding2CommissionShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENBuilding2CommissionController/message/
  // soapAction: http://ksoe.org/ENBuilding2CommissionController/action/ENBuilding2CommissionController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENBuilding2CommissionControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENBuilding2CommissionController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENBuilding2CommissionControllerSoapPort = interface(IInvokable)
  ['{F0D2F2DF-ABD1-40B9-8B67-7FB3D16B1FA2}']
    function add(const aENBuilding2Commission: ENBuilding2Commission): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENBuilding2Commission: ENBuilding2Commission); stdcall;
    function getObject(const anObjectCode: Integer): ENBuilding2Commission; stdcall;
    function getList: ENBuilding2CommissionShortList; stdcall;
    function getFilteredList(const aENBuilding2CommissionFilter: ENBuilding2CommissionFilter): ENBuilding2CommissionShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENBuilding2CommissionShortList; stdcall;
    function getScrollableFilteredList(const aENBuilding2CommissionFilter: ENBuilding2CommissionFilter; const aFromPosition: Integer; const aQuantity: Integer): ENBuilding2CommissionShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENBuilding2CommissionShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENBuilding2CommissionFilter: ENBuilding2CommissionFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENBuilding2CommissionShort; stdcall;
  end;


implementation

  destructor ENBuilding2Commission.Destroy;
  begin
    if Assigned(FENBuildingRef) then
      ENBuildingRef.Free;
    if Assigned(FENBuildingCommissionTypeRef) then
      ENBuildingCommissionTypeRef.Free;
    inherited Destroy;
  end;

{
  destructor ENBuilding2CommissionFilter.Destroy;
  begin
    if Assigned(FENBuildingRef) then
      ENBuildingRef.Free;
    if Assigned(FENBuildingCommissionTypeRef) then
      ENBuildingCommissionTypeRef.Free;
    inherited Destroy;
  end;
}

  destructor ENBuilding2CommissionFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENBuilding2CommissionShort.Destroy;
  begin
    if Assigned(FENBuildingRefDateGen) then
      ENBuildingRefDateGen.Free;
    if Assigned(FENBuildingRefDateEdit) then
      ENBuildingRefDateEdit.Free;
    if Assigned(FENBuildingRefSummaGen) then
      ENBuildingRefSummaGen.Free;
    if Assigned(FENBuildingRefSummaNDS) then
      ENBuildingRefSummaNDS.Free;
    if Assigned(FENBuildingRefContractPrice) then
      ENBuildingRefContractPrice.Free;
    if Assigned(FENBuildingRefFinContractDate) then
      ENBuildingRefFinContractDate.Free;
    if Assigned(FENBuildingRefDecreeDate) then
      ENBuildingRefDecreeDate.Free;
    if Assigned(FENBuildingRefDateLoadExpl) then
      ENBuildingRefDateLoadExpl.Free;
    if Assigned(FENBuildingRefDateBuild) then
      ENBuildingRefDateBuild.Free;
    inherited Destroy;
  end;

  destructor ENBuilding2CommissionShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENBuilding2Commission, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBuilding2Commission');
  RemClassRegistry.RegisterXSClass(ENBuilding2CommissionRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBuilding2CommissionRef');
  RemClassRegistry.RegisterXSClass(ENBuilding2CommissionFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBuilding2CommissionFilter');
  RemClassRegistry.RegisterXSClass(ENBuilding2CommissionShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBuilding2CommissionShort');
  RemClassRegistry.RegisterXSClass(ENBuilding2CommissionShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBuilding2CommissionShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENBuilding2CommissionShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENBuilding2CommissionShort');

  InvRegistry.RegisterInterface(TypeInfo(ENBuilding2CommissionControllerSoapPort), 'http://ksoe.org/ENBuilding2CommissionController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENBuilding2CommissionControllerSoapPort), 'http://ksoe.org/ENBuilding2CommissionController/action/ENBuilding2CommissionController.%operationName%');


end.

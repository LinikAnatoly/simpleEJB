unit FINDoc2MolDataController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,FINMolDataController
   ,FINDocTypeController
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

  FINDoc2MolData            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  FINDoc2MolDataRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  FINDoc2MolData = class(TRemotable)
  private
    Fcode : Integer;
    FfinDocCode : Integer;
    FfinDocCode2 : Integer;
    FaxJournalId : WideString;
    Fmodify_time : Int64;
//???
    FmolData : FINMolData;
//???
    FfinDocTypeRef : FINDocTypeRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property  finDocCode : Integer read FfinDocCode write FfinDocCode;
    property  finDocCode2 : Integer read FfinDocCode2 write FfinDocCode2;
    property axJournalId : WideString read FaxJournalId write FaxJournalId;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property molData : FINMolData read FmolData write FmolData;
    property finDocTypeRef : FINDocTypeRef read FfinDocTypeRef write FfinDocTypeRef;
  end;

{
  FINDoc2MolDataFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FfinDocCode : Integer;
    FfinDocCode2 : Integer;
    FaxJournalId : WideString;
    Fmodify_time : Int64;
//???
    FmolData : FINMolData;
//???
    FfinDocTypeRef : FINDocTypeRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property  finDocCode : Integer read FfinDocCode write FfinDocCode;
    property  finDocCode2 : Integer read FfinDocCode2 write FfinDocCode2;
    property axJournalId : WideString read FaxJournalId write FaxJournalId;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property molData : FINMolData read FmolData write FmolData;
    property finDocTypeRef : FINDocTypeRef read FfinDocTypeRef write FfinDocTypeRef;
  end;
}

  FINDoc2MolDataFilter = class(FINDoc2MolData)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  FINDoc2MolDataShort = class(TRemotable)
  private
    Fcode : Integer;
    FfinDocCode : Integer;
    FfinDocCode2 : Integer;
    FaxJournalId : WideString;
    FmolDataCode : Integer;
    FmolDataFinMolCode : WideString;
    FmolDataFinMolName : WideString;
    FfinDocTypeRefCode : Integer;
    FfinDocTypeRefName : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property  finDocCode : Integer read FfinDocCode write FfinDocCode;
    property  finDocCode2 : Integer read FfinDocCode2 write FfinDocCode2;
    property axJournalId : WideString read FaxJournalId write FaxJournalId;

    property molDataCode : Integer read FmolDataCode write FmolDataCode;
    property molDataFinMolCode : WideString read FmolDataFinMolCode write FmolDataFinMolCode;
    property molDataFinMolName : WideString read FmolDataFinMolName write FmolDataFinMolName;
    property finDocTypeRefCode : Integer read FfinDocTypeRefCode write FfinDocTypeRefCode;
    property finDocTypeRefName : WideString read FfinDocTypeRefName write FfinDocTypeRefName;
  end;

  ArrayOfFINDoc2MolDataShort = array of FINDoc2MolDataShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  FINDoc2MolDataShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfFINDoc2MolDataShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfFINDoc2MolDataShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/FINDoc2MolDataController/message/
  // soapAction: http://ksoe.org/FINDoc2MolDataController/action/FINDoc2MolDataController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : FINDoc2MolDataControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : FINDoc2MolDataController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  FINDoc2MolDataControllerSoapPort = interface(IInvokable)
  ['{5F1808C6-E6A1-4353-A64D-2B5B3E3AA98B}']
    function add(const aFINDoc2MolData: FINDoc2MolData): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aFINDoc2MolData: FINDoc2MolData); stdcall;
    function getObject(const anObjectCode: Integer): FINDoc2MolData; stdcall;
    function getList: FINDoc2MolDataShortList; stdcall;
    function getFilteredList(const aFINDoc2MolDataFilter: FINDoc2MolDataFilter): FINDoc2MolDataShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): FINDoc2MolDataShortList; stdcall;
    function getScrollableFilteredList(const aFINDoc2MolDataFilter: FINDoc2MolDataFilter; const aFromPosition: Integer; const aQuantity: Integer): FINDoc2MolDataShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): FINDoc2MolDataShortList; stdcall;
    function getScrollableFilteredCodeArray(const aFINDoc2MolDataFilter: FINDoc2MolDataFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): FINDoc2MolDataShort; stdcall;
  end;


implementation

  destructor FINDoc2MolData.Destroy;
  begin
    if Assigned(FmolData) then
      molData.Free;
    if Assigned(FfinDocTypeRef) then
      finDocTypeRef.Free;
    inherited Destroy;
  end;

{
  destructor FINDoc2MolDataFilter.Destroy;
  begin
    if Assigned(FmolData) then
      molData.Free;
    if Assigned(FfinDocTypeRef) then
      finDocTypeRef.Free;
    inherited Destroy;
  end;
}

  destructor FINDoc2MolDataFilter.Destroy;
  begin
    inherited Destroy;
  end;


  destructor FINDoc2MolDataShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(FINDoc2MolData, 'http://ksoe.org/EnergyproControllerService/type/', 'FINDoc2MolData');
  RemClassRegistry.RegisterXSClass(FINDoc2MolDataRef, 'http://ksoe.org/EnergyproControllerService/type/', 'FINDoc2MolDataRef');
  RemClassRegistry.RegisterXSClass(FINDoc2MolDataFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'FINDoc2MolDataFilter');
  RemClassRegistry.RegisterXSClass(FINDoc2MolDataShort, 'http://ksoe.org/EnergyproControllerService/type/', 'FINDoc2MolDataShort');
  RemClassRegistry.RegisterXSClass(FINDoc2MolDataShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'FINDoc2MolDataShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfFINDoc2MolDataShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfFINDoc2MolDataShort');

  InvRegistry.RegisterInterface(TypeInfo(FINDoc2MolDataControllerSoapPort), 'http://ksoe.org/FINDoc2MolDataController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(FINDoc2MolDataControllerSoapPort), 'http://ksoe.org/FINDoc2MolDataController/action/FINDoc2MolDataController.%operationName%');


end.

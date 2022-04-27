unit ENAct2FinKodIstController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENActController
   ,FinKodIstController
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

  ENAct2FinKodIst            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENAct2FinKodIstRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENAct2FinKodIst = class(TRemotable)
  private
    Fcode : Integer;
//???
    FactRef : ENActRef;
//???
    FkodIstRef : FinKodIstRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property actRef : ENActRef read FactRef write FactRef;
    property kodIstRef : FinKodIstRef read FkodIstRef write FkodIstRef;
  end;

{
  ENAct2FinKodIstFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
//???
    FactRef : ENActRef;
//???
    FkodIstRef : FinKodIstRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property actRef : ENActRef read FactRef write FactRef;
    property kodIstRef : FinKodIstRef read FkodIstRef write FkodIstRef;
  end;
}

  ENAct2FinKodIstFilter = class(ENAct2FinKodIst)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENAct2FinKodIstShort = class(TRemotable)
  private
    Fcode : Integer;
    FactRefCode : Integer;
    FactRefNumberGen : WideString;
    FactRefDateGen : TXSDate;
    FactRefFinDocCode : Integer;
    FactRefFinDocMechanicCode : Integer;
    FactRefFinMolName : WideString;
    FactRefFinMechanicName : WideString;
    FactRefInvNumber : WideString;
    FactRefUserGen : WideString;
    FactRefDateEdit : TXSDate;
    FactRefDateAct : TXSDate;
    FkodIstRefCode : Integer;
    FkodIstRefName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;

    property actRefCode : Integer read FactRefCode write FactRefCode;
    property actRefNumberGen : WideString read FactRefNumberGen write FactRefNumberGen;
    property actRefDateGen : TXSDate read FactRefDateGen write FactRefDateGen;
    property actRefFinDocCode : Integer read FactRefFinDocCode write FactRefFinDocCode;
    property actRefFinDocMechanicCode : Integer read FactRefFinDocMechanicCode write FactRefFinDocMechanicCode;
    property actRefFinMolName : WideString read FactRefFinMolName write FactRefFinMolName;
    property actRefFinMechanicName : WideString read FactRefFinMechanicName write FactRefFinMechanicName;
    property actRefInvNumber : WideString read FactRefInvNumber write FactRefInvNumber;
    property actRefUserGen : WideString read FactRefUserGen write FactRefUserGen;
    property actRefDateEdit : TXSDate read FactRefDateEdit write FactRefDateEdit;
    property actRefDateAct : TXSDate read FactRefDateAct write FactRefDateAct;
    property kodIstRefCode : Integer read FkodIstRefCode write FkodIstRefCode;
    property kodIstRefName : WideString read FkodIstRefName write FkodIstRefName;
  end;

  ArrayOfENAct2FinKodIstShort = array of ENAct2FinKodIstShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENAct2FinKodIstShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENAct2FinKodIstShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENAct2FinKodIstShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENAct2FinKodIstController/message/
  // soapAction: http://ksoe.org/ENAct2FinKodIstController/action/ENAct2FinKodIstController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENAct2FinKodIstControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENAct2FinKodIstController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENAct2FinKodIstControllerSoapPort = interface(IInvokable)
  ['{1E9AE94D-6669-4CD9-801D-2E93526679B3}']
    function add(const aENAct2FinKodIst: ENAct2FinKodIst): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENAct2FinKodIst: ENAct2FinKodIst); stdcall;
    function getObject(const anObjectCode: Integer): ENAct2FinKodIst; stdcall;
    function getList: ENAct2FinKodIstShortList; stdcall;
    function getFilteredList(const aENAct2FinKodIstFilter: ENAct2FinKodIstFilter): ENAct2FinKodIstShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENAct2FinKodIstShortList; stdcall;
    function getScrollableFilteredList(const aENAct2FinKodIstFilter: ENAct2FinKodIstFilter; const aFromPosition: Integer; const aQuantity: Integer): ENAct2FinKodIstShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENAct2FinKodIstShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENAct2FinKodIstFilter: ENAct2FinKodIstFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENAct2FinKodIstShort; stdcall;
    procedure setKodIst4Oz(const kodIstCode: Integer; const ozCode : Integer); stdcall;

  end;


implementation

  destructor ENAct2FinKodIst.Destroy;
  begin
    if Assigned(FactRef) then
      actRef.Free;
    if Assigned(FkodIstRef) then
      kodIstRef.Free;
    inherited Destroy;
  end;

{
  destructor ENAct2FinKodIstFilter.Destroy;
  begin
    if Assigned(FactRef) then
      actRef.Free;
    if Assigned(FkodIstRef) then
      kodIstRef.Free;
    inherited Destroy;
  end;
}

  destructor ENAct2FinKodIstFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENAct2FinKodIstShort.Destroy;
  begin
    if Assigned(FactRefDateGen) then
      actRefDateGen.Free;
    if Assigned(FactRefDateEdit) then
      actRefDateEdit.Free;
    if Assigned(FactRefDateAct) then
      actRefDateAct.Free;
    inherited Destroy;
  end;

  destructor ENAct2FinKodIstShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENAct2FinKodIst, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAct2FinKodIst');
  RemClassRegistry.RegisterXSClass(ENAct2FinKodIstRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAct2FinKodIstRef');
  RemClassRegistry.RegisterXSClass(ENAct2FinKodIstFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAct2FinKodIstFilter');
  RemClassRegistry.RegisterXSClass(ENAct2FinKodIstShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAct2FinKodIstShort');
  RemClassRegistry.RegisterXSClass(ENAct2FinKodIstShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAct2FinKodIstShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENAct2FinKodIstShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENAct2FinKodIstShort');

  InvRegistry.RegisterInterface(TypeInfo(ENAct2FinKodIstControllerSoapPort), 'http://ksoe.org/ENAct2FinKodIstController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENAct2FinKodIstControllerSoapPort), 'http://ksoe.org/ENAct2FinKodIstController/action/ENAct2FinKodIstController.%operationName%');


end.

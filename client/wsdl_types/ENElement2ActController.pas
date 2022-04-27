unit ENElement2ActController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENElementController
   ,ENActController
   ,ENElement2ActTypeController
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

  ENElement2Act            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENElement2ActRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENElement2Act = class(TRemotable)
  private
    Fcode : Integer;
//???
    FelementRef : ENElementRef;
//???
    FactRef : ENActRef;
//???
    FtypeRef : ENElement2ActTypeRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property elementRef : ENElementRef read FelementRef write FelementRef;
    property actRef : ENActRef read FactRef write FactRef;
    property typeRef : ENElement2ActTypeRef read FtypeRef write FtypeRef;
  end;

{
  ENElement2ActFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
//???
    FelementRef : ENElementRef;
//???
    FactRef : ENActRef;
//???
    FtypeRef : ENElement2ActTypeRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property elementRef : ENElementRef read FelementRef write FelementRef;
    property actRef : ENActRef read FactRef write FactRef;
    property typeRef : ENElement2ActTypeRef read FtypeRef write FtypeRef;
  end;
}

  ENElement2ActFilter = class(ENElement2Act)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENElement2ActShort = class(TRemotable)
  private
    Fcode : Integer;
    FelementRefCode : Integer;
    FactRefCode : Integer;
    FactRefNumberGen : WideString;
    FactRefDateGen : TXSDate;
    FactRefFinMolCode : WideString;
    FactRefFinMolName : WideString;
    FactRefFinMechanicName : WideString;
    FactRefInvNumber : WideString;
    FactRefUserGen : WideString;
    FactRefDateEdit : TXSDate;
    FactRefDateAct : TXSDate;
    FactRefMolCodeObject : WideString;
    FactRefCheckedByAccountant : TXSBoolean;
    FtypeRefCode : Integer;
    FtypeRefName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;

    property elementRefCode : Integer read FelementRefCode write FelementRefCode;
    property actRefCode : Integer read FactRefCode write FactRefCode;
    property actRefNumberGen : WideString read FactRefNumberGen write FactRefNumberGen;
    property actRefDateGen : TXSDate read FactRefDateGen write FactRefDateGen;
    property actRefFinMolCode : WideString read FactRefFinMolCode write FactRefFinMolCode;
    property actRefFinMolName : WideString read FactRefFinMolName write FactRefFinMolName;
    property actRefFinMechanicName : WideString read FactRefFinMechanicName write FactRefFinMechanicName;
    property actRefInvNumber : WideString read FactRefInvNumber write FactRefInvNumber;
    property actRefUserGen : WideString read FactRefUserGen write FactRefUserGen;
    property actRefDateEdit : TXSDate read FactRefDateEdit write FactRefDateEdit;
    property actRefDateAct : TXSDate read FactRefDateAct write FactRefDateAct;
    property actRefMolCodeObject : WideString read FactRefMolCodeObject write FactRefMolCodeObject;
    property actRefCheckedByAccountant : TXSBoolean read FactRefCheckedByAccountant write FactRefCheckedByAccountant;
    property typeRefCode : Integer read FtypeRefCode write FtypeRefCode;
    property typeRefName : WideString read FtypeRefName write FtypeRefName;
  end;

  ArrayOfENElement2ActShort = array of ENElement2ActShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENElement2ActShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENElement2ActShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENElement2ActShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENElement2ActController/message/
  // soapAction: http://ksoe.org/ENElement2ActController/action/ENElement2ActController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENElement2ActControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENElement2ActController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENElement2ActControllerSoapPort = interface(IInvokable)
  ['{C1800B71-8D23-4B57-89C2-C9D0E855B7F2}']
    function add(const aENElement2Act: ENElement2Act): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); overload; stdcall;
    procedure remove(const elementCode : Integer; const actCode : Integer; const typeCode : Integer); overload; stdcall;
    procedure save(const aENElement2Act: ENElement2Act); stdcall;
    function getObject(const anObjectCode: Integer): ENElement2Act; stdcall;
    function getList: ENElement2ActShortList; stdcall;
    function getFilteredList(const aENElement2ActFilter: ENElement2ActFilter): ENElement2ActShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENElement2ActShortList; stdcall;
    function getScrollableFilteredList(const aENElement2ActFilter: ENElement2ActFilter; const aFromPosition: Integer; const aQuantity: Integer): ENElement2ActShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENElement2ActShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENElement2ActFilter: ENElement2ActFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENElement2ActShort; stdcall;
  end;


implementation

  destructor ENElement2Act.Destroy;
  begin
    if Assigned(FelementRef) then
      elementRef.Free;
    if Assigned(FactRef) then
      actRef.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    inherited Destroy;
  end;

{
  destructor ENElement2ActFilter.Destroy;
  begin
    if Assigned(FelementRef) then
      elementRef.Free;
    if Assigned(FactRef) then
      actRef.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    inherited Destroy;
  end;
}

  destructor ENElement2ActFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENElement2ActShort.Destroy;
  begin
    if Assigned(FactRefDateGen) then
      actRefDateGen.Free;
    if Assigned(FactRefDateEdit) then
      actRefDateEdit.Free;
    if Assigned(FactRefDateAct) then
      actRefDateAct.Free;
    inherited Destroy;
  end;

  destructor ENElement2ActShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENElement2Act, 'http://ksoe.org/EnergyproControllerService/type/', 'ENElement2Act');
  RemClassRegistry.RegisterXSClass(ENElement2ActRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENElement2ActRef');
  RemClassRegistry.RegisterXSClass(ENElement2ActFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENElement2ActFilter');
  RemClassRegistry.RegisterXSClass(ENElement2ActShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENElement2ActShort');
  RemClassRegistry.RegisterXSClass(ENElement2ActShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENElement2ActShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENElement2ActShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENElement2ActShort');

  InvRegistry.RegisterInterface(TypeInfo(ENElement2ActControllerSoapPort), 'http://ksoe.org/ENElement2ActController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENElement2ActControllerSoapPort), 'http://ksoe.org/ENElement2ActController/action/ENElement2ActController.%operationName%');


end.

unit RQBoxController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,RQStorageZoneController
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

  RQBox            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQBoxRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQBox = class(TRemotable)
  private
    Fcode : Integer;
    FnumberGen : WideString;
    FcountGen : TXSDecimal;
//???
    FstorageZoneRef : RQStorageZoneRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property storageZoneRef : RQStorageZoneRef read FstorageZoneRef write FstorageZoneRef;
  end;

{
  RQBoxFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FnumberGen : WideString;
    FcountGen : TXSDecimal;
//???
    FstorageZoneRef : RQStorageZoneRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property storageZoneRef : RQStorageZoneRef read FstorageZoneRef write FstorageZoneRef;
  end;
}

  RQBoxFilter = class(RQBox)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQBoxShort = class(TRemotable)
  private
    Fcode : Integer;
    FnumberGen : WideString;
    FcountGen : TXSDecimal;
    FstorageZoneRefCode : Integer;
    FstorageZoneRefName : WideString;
    FstorageZoneRefDescription : WideString;
    FstorageZoneRefUserGen : WideString;
    FstorageZoneRefDateEdit : TXSDateTime;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property countGen : TXSDecimal read FcountGen write FcountGen;

    property storageZoneRefCode : Integer read FstorageZoneRefCode write FstorageZoneRefCode;
    property storageZoneRefName : WideString read FstorageZoneRefName write FstorageZoneRefName;
    property storageZoneRefDescription : WideString read FstorageZoneRefDescription write FstorageZoneRefDescription;
    property storageZoneRefUserGen : WideString read FstorageZoneRefUserGen write FstorageZoneRefUserGen;
    property storageZoneRefDateEdit : TXSDateTime read FstorageZoneRefDateEdit write FstorageZoneRefDateEdit;
  end;

  ArrayOfRQBoxShort = array of RQBoxShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQBoxShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQBoxShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQBoxShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQBoxController/message/
  // soapAction: http://ksoe.org/RQBoxController/action/RQBoxController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQBoxControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQBoxController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQBoxControllerSoapPort = interface(IInvokable)
  ['{12381238-1238-1238-1238-123812381238}']
    function add(const aRQBox: RQBox): Integer; stdcall;
    procedure remove(const anObjectCode: Integer; const packingListCode: Integer); stdcall;
    procedure save(const aRQBox: RQBox); stdcall;
    function getObject(const anObjectCode: Integer): RQBox; stdcall;
    function getList: RQBoxShortList; stdcall;
    function getFilteredList(const aRQBoxFilter: RQBoxFilter): RQBoxShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQBoxShortList; stdcall;
    function getScrollableFilteredList(const aRQBoxFilter: RQBoxFilter; const aFromPosition: Integer; const aQuantity: Integer): RQBoxShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQBoxShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQBoxFilter: RQBoxFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQBoxShort; stdcall;
  end;


implementation

  destructor RQBox.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FstorageZoneRef) then
      storageZoneRef.Free;
    inherited Destroy;
  end;

{
  destructor RQBoxFilter.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FstorageZoneRef) then
      storageZoneRef.Free;
    inherited Destroy;
  end;
}

  destructor RQBoxFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor RQBoxShort.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FstorageZoneRefDateEdit) then
      storageZoneRefDateEdit.Free;
    inherited Destroy;
  end;

  destructor RQBoxShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQBox, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBox');
  RemClassRegistry.RegisterXSClass(RQBoxRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBoxRef');
  RemClassRegistry.RegisterXSClass(RQBoxFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBoxFilter');
  RemClassRegistry.RegisterXSClass(RQBoxShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBoxShort');
  RemClassRegistry.RegisterXSClass(RQBoxShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBoxShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQBoxShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQBoxShort');

  InvRegistry.RegisterInterface(TypeInfo(RQBoxControllerSoapPort), 'http://ksoe.org/RQBoxController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQBoxControllerSoapPort), 'http://ksoe.org/RQBoxController/action/RQBoxController.%operationName%');


end.

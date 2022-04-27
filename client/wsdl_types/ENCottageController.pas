unit ENCottageController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
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

  ENCottage            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENCottageRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENCottage = class(TRemotable)
  private
    Fcode : Integer;
    FnumberGen : WideString;
    FnumberBeds : Integer;
    Fdescription : WideString;
    Fcommentgen : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    Fmodify_time : Int64;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property  numberBeds : Integer read FnumberBeds write FnumberBeds;
    property description : WideString read Fdescription write Fdescription;
    property commentgen : WideString read Fcommentgen write Fcommentgen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
  end;

{
  ENCottageFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FnumberGen : WideString;
    FnumberBeds : Integer;
    Fdescription : WideString;
    Fcommentgen : WideString;
    FuserGen : WideString;
    FdateEdit : DateTime;
    Fmodify_time : Int64;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property  numberBeds : Integer read FnumberBeds write FnumberBeds;
    property description : WideString read Fdescription write Fdescription;
    property commentgen : WideString read Fcommentgen write Fcommentgen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : DateTime;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
  end;
}

  ENCottageFilter = class(ENCottage)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENCottageShort = class(TRemotable)
  private
    Fcode : Integer;
    FnumberGen : WideString;
    FnumberBeds : Integer;
    Fdescription : WideString;
    Fcommentgen : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property  numberBeds : Integer read FnumberBeds write FnumberBeds;
    property description : WideString read Fdescription write Fdescription;
    property commentgen : WideString read Fcommentgen write Fcommentgen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;

  end;

  ArrayOfENCottageShort = array of ENCottageShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENCottageShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENCottageShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENCottageShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENCottageController/message/
  // soapAction: http://ksoe.org/ENCottageController/action/ENCottageController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENCottageControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENCottageController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENCottageControllerSoapPort = interface(IInvokable)
  ['{B5E1575C-FC47-40B1-8A28-A4D1DBEECC4A}']
    function add(const aENCottage: ENCottage): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENCottage: ENCottage); stdcall;
    function getObject(const anObjectCode: Integer): ENCottage; stdcall;
    function getList: ENCottageShortList; stdcall;
    function getFilteredList(const aENCottageFilter: ENCottageFilter): ENCottageShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENCottageShortList; stdcall;
    function getScrollableFilteredList(const aENCottageFilter: ENCottageFilter; const aFromPosition: Integer; const aQuantity: Integer): ENCottageShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENCottageShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENCottageFilter: ENCottageFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENCottageShort; stdcall;
  end;


implementation

  destructor ENCottage.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    inherited Destroy;
  end;

{
  destructor ENCottageFilter.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    inherited Destroy;
  end;
}

  destructor ENCottageFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENCottageShort.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    inherited Destroy;
  end;

  destructor ENCottageShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENCottage, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCottage');
  RemClassRegistry.RegisterXSClass(ENCottageRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCottageRef');
  RemClassRegistry.RegisterXSClass(ENCottageFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCottageFilter');
  RemClassRegistry.RegisterXSClass(ENCottageShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCottageShort');
  RemClassRegistry.RegisterXSClass(ENCottageShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCottageShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENCottageShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENCottageShort');

  InvRegistry.RegisterInterface(TypeInfo(ENCottageControllerSoapPort), 'http://ksoe.org/ENCottageController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENCottageControllerSoapPort), 'http://ksoe.org/ENCottageController/action/ENCottageController.%operationName%');


end.

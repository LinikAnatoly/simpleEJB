unit ENTechAgr2SOKindController;

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

  ENTechAgr2SOKind            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTechAgr2SOKindRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTechAgr2SOKind = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  ENTechAgr2SOKindFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fname : WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;
}

  ENTechAgr2SOKindFilter = class(ENTechAgr2SOKind)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENTechAgr2SOKindShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENTechAgr2SOKindShort = array of ENTechAgr2SOKindShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENTechAgr2SOKindShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENTechAgr2SOKindShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENTechAgr2SOKindShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENTechAgr2SOKindController/message/
  // soapAction: http://ksoe.org/ENTechAgr2SOKindController/action/ENTechAgr2SOKindController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENTechAgr2SOKindControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENTechAgr2SOKindController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENTechAgr2SOKindControllerSoapPort = interface(IInvokable)
  ['{78AC16F9-B259-449A-BA25-7704721FA8DB}']
    function add(const aENTechAgr2SOKind: ENTechAgr2SOKind): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENTechAgr2SOKind: ENTechAgr2SOKind); stdcall;
    function getObject(const anObjectCode: Integer): ENTechAgr2SOKind; stdcall;
    function getList: ENTechAgr2SOKindShortList; stdcall;
    function getFilteredList(const aENTechAgr2SOKindFilter: ENTechAgr2SOKindFilter): ENTechAgr2SOKindShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENTechAgr2SOKindShortList; stdcall;
    function getScrollableFilteredList(const aENTechAgr2SOKindFilter: ENTechAgr2SOKindFilter; const aFromPosition: Integer; const aQuantity: Integer): ENTechAgr2SOKindShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENTechAgr2SOKindShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENTechAgr2SOKindFilter: ENTechAgr2SOKindFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENTechAgr2SOKindShort; stdcall;
  end;


implementation



  destructor ENTechAgr2SOKindShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENTechAgr2SOKind, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTechAgr2SOKind');
  RemClassRegistry.RegisterXSClass(ENTechAgr2SOKindRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTechAgr2SOKindRef');
  RemClassRegistry.RegisterXSClass(ENTechAgr2SOKindFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTechAgr2SOKindFilter');
  RemClassRegistry.RegisterXSClass(ENTechAgr2SOKindShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTechAgr2SOKindShort');
  RemClassRegistry.RegisterXSClass(ENTechAgr2SOKindShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTechAgr2SOKindShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENTechAgr2SOKindShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENTechAgr2SOKindShort');

  InvRegistry.RegisterInterface(TypeInfo(ENTechAgr2SOKindControllerSoapPort), 'http://ksoe.org/ENTechAgr2SOKindController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENTechAgr2SOKindControllerSoapPort), 'http://ksoe.org/ENTechAgr2SOKindController/action/ENTechAgr2SOKindController.%operationName%');


end.

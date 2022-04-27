unit ENActFailureReasonController;

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

  ENActFailureReason            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENActFailureReasonRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENActFailureReason = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  ENActFailureReasonFilter = class(TRemotable)
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

  ENActFailureReasonFilter = class(ENActFailureReason)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENActFailureReasonShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENActFailureReasonShort = array of ENActFailureReasonShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENActFailureReasonShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENActFailureReasonShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENActFailureReasonShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENActFailureReasonController/message/
  // soapAction: http://ksoe.org/ENActFailureReasonController/action/ENActFailureReasonController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENActFailureReasonControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENActFailureReasonController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENActFailureReasonControllerSoapPort = interface(IInvokable)
  ['{1eff1eff-1eff-1eff-1eff-1eff1eff1eff}']
    function add(const aENActFailureReason: ENActFailureReason): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENActFailureReason: ENActFailureReason); stdcall;
    function getObject(const anObjectCode: Integer): ENActFailureReason; stdcall;
    function getList: ENActFailureReasonShortList; stdcall;
    function getFilteredList(const aENActFailureReasonFilter: ENActFailureReasonFilter): ENActFailureReasonShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENActFailureReasonShortList; stdcall;
    function getScrollableFilteredList(const aENActFailureReasonFilter: ENActFailureReasonFilter; const aFromPosition: Integer; const aQuantity: Integer): ENActFailureReasonShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENActFailureReasonShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENActFailureReasonFilter: ENActFailureReasonFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENActFailureReasonShort; stdcall;
  end;


implementation



  destructor ENActFailureReasonShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENActFailureReason, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActFailureReason');
  RemClassRegistry.RegisterXSClass(ENActFailureReasonRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActFailureReasonRef');
  RemClassRegistry.RegisterXSClass(ENActFailureReasonFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActFailureReasonFilter');
  RemClassRegistry.RegisterXSClass(ENActFailureReasonShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActFailureReasonShort');
  RemClassRegistry.RegisterXSClass(ENActFailureReasonShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActFailureReasonShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENActFailureReasonShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENActFailureReasonShort');

  InvRegistry.RegisterInterface(TypeInfo(ENActFailureReasonControllerSoapPort), 'http://ksoe.org/ENActFailureReasonController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENActFailureReasonControllerSoapPort), 'http://ksoe.org/ENActFailureReasonController/action/ENActFailureReasonController.%operationName%');


end.

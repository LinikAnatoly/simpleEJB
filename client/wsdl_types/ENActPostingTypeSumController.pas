unit ENActPostingTypeSumController;

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

  ENActPostingTypeSum            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENActPostingTypeSumRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENActPostingTypeSum = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  ENActPostingTypeSumFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fname : WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;
}

  ENActPostingTypeSumFilter = class(ENActPostingTypeSum)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENActPostingTypeSumShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENActPostingTypeSumShort = array of ENActPostingTypeSumShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENActPostingTypeSumShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENActPostingTypeSumShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENActPostingTypeSumShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENActPostingTypeSumController/message/
  // soapAction: http://ksoe.org/ENActPostingTypeSumController/action/ENActPostingTypeSumController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENActPostingTypeSumControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENActPostingTypeSumController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENActPostingTypeSumControllerSoapPort = interface(IInvokable)
  ['{B21A8D5C-BB66-4850-BFA9-2443CC2B556B}']
    function add(const aENActPostingTypeSum: ENActPostingTypeSum): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENActPostingTypeSum: ENActPostingTypeSum); stdcall;
    function getObject(const anObjectCode: Integer): ENActPostingTypeSum; stdcall;
    function getList: ENActPostingTypeSumShortList; stdcall;
    function getFilteredList(const aENActPostingTypeSumFilter: ENActPostingTypeSumFilter): ENActPostingTypeSumShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENActPostingTypeSumShortList; stdcall;
    function getScrollableFilteredList(const aENActPostingTypeSumFilter: ENActPostingTypeSumFilter; const aFromPosition: Integer; const aQuantity: Integer): ENActPostingTypeSumShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENActPostingTypeSumShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENActPostingTypeSumFilter: ENActPostingTypeSumFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENActPostingTypeSumShort; stdcall;
  end;


implementation



  destructor ENActPostingTypeSumShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENActPostingTypeSum, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActPostingTypeSum');
  RemClassRegistry.RegisterXSClass(ENActPostingTypeSumRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActPostingTypeSumRef');
  RemClassRegistry.RegisterXSClass(ENActPostingTypeSumFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActPostingTypeSumFilter');
  RemClassRegistry.RegisterXSClass(ENActPostingTypeSumShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActPostingTypeSumShort');
  RemClassRegistry.RegisterXSClass(ENActPostingTypeSumShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActPostingTypeSumShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENActPostingTypeSumShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENActPostingTypeSumShort');

  InvRegistry.RegisterInterface(TypeInfo(ENActPostingTypeSumControllerSoapPort), 'http://ksoe.org/ENActPostingTypeSumController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENActPostingTypeSumControllerSoapPort), 'http://ksoe.org/ENActPostingTypeSumController/action/ENActPostingTypeSumController.%operationName%');


end.

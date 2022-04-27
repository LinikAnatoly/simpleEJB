unit ENActInvestType2DFDocController;

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

  ENActInvestType2DFDoc            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENActInvestType2DFDocRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENActInvestType2DFDoc = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  ENActInvestType2DFDocFilter = class(TRemotable)
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

  ENActInvestType2DFDocFilter = class(ENActInvestType2DFDoc)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENActInvestType2DFDocShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENActInvestType2DFDocShort = array of ENActInvestType2DFDocShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENActInvestType2DFDocShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENActInvestType2DFDocShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENActInvestType2DFDocShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENActInvestType2DFDocController/message/
  // soapAction: http://ksoe.org/ENActInvestType2DFDocController/action/ENActInvestType2DFDocController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENActInvestType2DFDocControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENActInvestType2DFDocController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENActInvestType2DFDocControllerSoapPort = interface(IInvokable)
  ['{92C4B012-5CAE-46CC-8236-5B6AE6BEC8C3}']
    function add(const aENActInvestType2DFDoc: ENActInvestType2DFDoc): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENActInvestType2DFDoc: ENActInvestType2DFDoc); stdcall;
    function getObject(const anObjectCode: Integer): ENActInvestType2DFDoc; stdcall;
    function getList: ENActInvestType2DFDocShortList; stdcall;
    function getFilteredList(const aENActInvestType2DFDocFilter: ENActInvestType2DFDocFilter): ENActInvestType2DFDocShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENActInvestType2DFDocShortList; stdcall;
    function getScrollableFilteredList(const aENActInvestType2DFDocFilter: ENActInvestType2DFDocFilter; const aFromPosition: Integer; const aQuantity: Integer): ENActInvestType2DFDocShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENActInvestType2DFDocShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENActInvestType2DFDocFilter: ENActInvestType2DFDocFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENActInvestType2DFDocShort; stdcall;
  end;


implementation



  destructor ENActInvestType2DFDocShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENActInvestType2DFDoc, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActInvestType2DFDoc');
  RemClassRegistry.RegisterXSClass(ENActInvestType2DFDocRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActInvestType2DFDocRef');
  RemClassRegistry.RegisterXSClass(ENActInvestType2DFDocFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActInvestType2DFDocFilter');
  RemClassRegistry.RegisterXSClass(ENActInvestType2DFDocShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActInvestType2DFDocShort');
  RemClassRegistry.RegisterXSClass(ENActInvestType2DFDocShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActInvestType2DFDocShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENActInvestType2DFDocShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENActInvestType2DFDocShort');

  InvRegistry.RegisterInterface(TypeInfo(ENActInvestType2DFDocControllerSoapPort), 'http://ksoe.org/ENActInvestType2DFDocController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENActInvestType2DFDocControllerSoapPort), 'http://ksoe.org/ENActInvestType2DFDocController/action/ENActInvestType2DFDocController.%operationName%');


end.

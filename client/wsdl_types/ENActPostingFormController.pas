unit ENActPostingFormController;

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

  ENActPostingForm            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENActPostingFormRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENActPostingForm = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  ENActPostingFormFilter = class(TRemotable)
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

  ENActPostingFormFilter = class(ENActPostingForm)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENActPostingFormShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENActPostingFormShort = array of ENActPostingFormShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENActPostingFormShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENActPostingFormShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENActPostingFormShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENActPostingFormController/message/
  // soapAction: http://ksoe.org/ENActPostingFormController/action/ENActPostingFormController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENActPostingFormControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENActPostingFormController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENActPostingFormControllerSoapPort = interface(IInvokable)
  ['{815EF222-2D0E-4699-ACEB-C99E089D6C7A}']
    function add(const aENActPostingForm: ENActPostingForm): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENActPostingForm: ENActPostingForm); stdcall;
    function getObject(const anObjectCode: Integer): ENActPostingForm; stdcall;
    function getList: ENActPostingFormShortList; stdcall;
    function getFilteredList(const aENActPostingFormFilter: ENActPostingFormFilter): ENActPostingFormShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENActPostingFormShortList; stdcall;
    function getScrollableFilteredList(const aENActPostingFormFilter: ENActPostingFormFilter; const aFromPosition: Integer; const aQuantity: Integer): ENActPostingFormShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENActPostingFormShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENActPostingFormFilter: ENActPostingFormFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENActPostingFormShort; stdcall;
  end;


implementation



  destructor ENActPostingFormShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENActPostingForm, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActPostingForm');
  RemClassRegistry.RegisterXSClass(ENActPostingFormRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActPostingFormRef');
  RemClassRegistry.RegisterXSClass(ENActPostingFormFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActPostingFormFilter');
  RemClassRegistry.RegisterXSClass(ENActPostingFormShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActPostingFormShort');
  RemClassRegistry.RegisterXSClass(ENActPostingFormShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActPostingFormShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENActPostingFormShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENActPostingFormShort');

  InvRegistry.RegisterInterface(TypeInfo(ENActPostingFormControllerSoapPort), 'http://ksoe.org/ENActPostingFormController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENActPostingFormControllerSoapPort), 'http://ksoe.org/ENActPostingFormController/action/ENActPostingFormController.%operationName%');


end.

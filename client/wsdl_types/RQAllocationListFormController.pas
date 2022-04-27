unit RQAllocationListFormController;

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
  // !:EPCalculatorShortList - "http://ksoe.org/EnergyproControllerService/type/"
  // !:EPCalculatorFilter - "http://ksoe.org/EnergyproControllerService/type/"

  RQAllocationListForm            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQAllocationListFormRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQAllocationListForm = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  RQAllocationListFormFilter = class(TRemotable)
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

  RQAllocationListFormFilter = class(RQAllocationListForm)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQAllocationListFormShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfRQAllocationListFormShort = array of RQAllocationListFormShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQAllocationListFormShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQAllocationListFormShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQAllocationListFormShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQAllocationListFormController/message/
  // soapAction: http://ksoe.org/RQAllocationListFormController/action/RQAllocationListFormController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQAllocationListFormControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQAllocationListFormController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQAllocationListFormControllerSoapPort = interface(IInvokable)
  ['{C1B69756-0999-4ABA-A3BB-F4C94272D54F}']
    function add(const aRQAllocationListForm: RQAllocationListForm): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQAllocationListForm: RQAllocationListForm); stdcall;
    function getObject(const anObjectCode: Integer): RQAllocationListForm; stdcall;
    function getList: RQAllocationListFormShortList; stdcall;
    function getFilteredList(const aRQAllocationListFormFilter: RQAllocationListFormFilter): RQAllocationListFormShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQAllocationListFormShortList; stdcall;
    function getScrollableFilteredList(const aRQAllocationListFormFilter: RQAllocationListFormFilter; const aFromPosition: Integer; const aQuantity: Integer): RQAllocationListFormShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQAllocationListFormShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQAllocationListFormFilter: RQAllocationListFormFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQAllocationListFormShort; stdcall;
  end;


implementation



  destructor RQAllocationListFormShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQAllocationListForm, 'http://ksoe.org/EnergyproControllerService/type/', 'RQAllocationListForm');
  RemClassRegistry.RegisterXSClass(RQAllocationListFormRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQAllocationListFormRef');
  RemClassRegistry.RegisterXSClass(RQAllocationListFormFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQAllocationListFormFilter');
  RemClassRegistry.RegisterXSClass(RQAllocationListFormShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQAllocationListFormShort');
  RemClassRegistry.RegisterXSClass(RQAllocationListFormShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQAllocationListFormShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQAllocationListFormShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQAllocationListFormShort');

  InvRegistry.RegisterInterface(TypeInfo(RQAllocationListFormControllerSoapPort), 'http://ksoe.org/RQAllocationListFormController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQAllocationListFormControllerSoapPort), 'http://ksoe.org/RQAllocationListFormController/action/RQAllocationListFormController.%operationName%');


end.

unit RQAllocationListTypeController;

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

  RQAllocationListType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQAllocationListTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQAllocationListType = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  RQAllocationListTypeFilter = class(TRemotable)
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

  RQAllocationListTypeFilter = class(RQAllocationListType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQAllocationListTypeShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfRQAllocationListTypeShort = array of RQAllocationListTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQAllocationListTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQAllocationListTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQAllocationListTypeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQAllocationListTypeController/message/
  // soapAction: http://ksoe.org/RQAllocationListTypeController/action/RQAllocationListTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQAllocationListTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQAllocationListTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQAllocationListTypeControllerSoapPort = interface(IInvokable)
  ['{09DBD35B-A6AE-4B43-A556-CC8E5204FCB3}']
    function add(const aRQAllocationListType: RQAllocationListType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQAllocationListType: RQAllocationListType); stdcall;
    function getObject(const anObjectCode: Integer): RQAllocationListType; stdcall;
    function getList: RQAllocationListTypeShortList; stdcall;
    function getFilteredList(const aRQAllocationListTypeFilter: RQAllocationListTypeFilter): RQAllocationListTypeShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQAllocationListTypeShortList; stdcall;
    function getScrollableFilteredList(const aRQAllocationListTypeFilter: RQAllocationListTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): RQAllocationListTypeShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQAllocationListTypeShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQAllocationListTypeFilter: RQAllocationListTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQAllocationListTypeShort; stdcall;
  end;


implementation



  destructor RQAllocationListTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQAllocationListType, 'http://ksoe.org/EnergyproControllerService/type/', 'RQAllocationListType');
  RemClassRegistry.RegisterXSClass(RQAllocationListTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQAllocationListTypeRef');
  RemClassRegistry.RegisterXSClass(RQAllocationListTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQAllocationListTypeFilter');
  RemClassRegistry.RegisterXSClass(RQAllocationListTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQAllocationListTypeShort');
  RemClassRegistry.RegisterXSClass(RQAllocationListTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQAllocationListTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQAllocationListTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQAllocationListTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(RQAllocationListTypeControllerSoapPort), 'http://ksoe.org/RQAllocationListTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQAllocationListTypeControllerSoapPort), 'http://ksoe.org/RQAllocationListTypeController/action/RQAllocationListTypeController.%operationName%');


end.

unit ENPlanWorkReasonTypeController;

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

  ENPlanWorkReasonType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanWorkReasonTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanWorkReasonType = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENPlanWorkReasonTypeFilter = class(TRemotable)
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

  ENPlanWorkReasonTypeFilter = class(ENPlanWorkReasonType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENPlanWorkReasonTypeShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENPlanWorkReasonTypeShort = array of ENPlanWorkReasonTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENPlanWorkReasonTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENPlanWorkReasonTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENPlanWorkReasonTypeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENPlanWorkReasonTypeController/message/
  // soapAction: http://ksoe.org/ENPlanWorkReasonTypeController/action/ENPlanWorkReasonTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENPlanWorkReasonTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENPlanWorkReasonTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENPlanWorkReasonTypeControllerSoapPort = interface(IInvokable)
  ['{12021202-1202-1202-1202-120212021202}']
    function  add(const aENPlanWorkReasonType: ENPlanWorkReasonType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENPlanWorkReasonType: ENPlanWorkReasonType); stdcall;
    function  getObject(const anObjectCode: Integer): ENPlanWorkReasonType; stdcall;
    function  getList: ENPlanWorkReasonTypeShortList; stdcall;
    function  getFilteredList(const aENPlanWorkReasonTypeFilter: ENPlanWorkReasonTypeFilter): ENPlanWorkReasonTypeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENPlanWorkReasonTypeShortList; stdcall;
    function  getScrollableFilteredList(const aENPlanWorkReasonTypeFilter: ENPlanWorkReasonTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENPlanWorkReasonTypeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENPlanWorkReasonTypeShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENPlanWorkReasonTypeFilter: ENPlanWorkReasonTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor ENPlanWorkReasonTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENPlanWorkReasonType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkReasonType');
  RemClassRegistry.RegisterXSClass(ENPlanWorkReasonTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkReasonTypeRef');
  RemClassRegistry.RegisterXSClass(ENPlanWorkReasonTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkReasonTypeFilter');
  RemClassRegistry.RegisterXSClass(ENPlanWorkReasonTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkReasonTypeShort');
  RemClassRegistry.RegisterXSClass(ENPlanWorkReasonTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkReasonTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENPlanWorkReasonTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENPlanWorkReasonTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENPlanWorkReasonTypeControllerSoapPort), 'http://ksoe.org/ENPlanWorkReasonTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENPlanWorkReasonTypeControllerSoapPort), 'http://ksoe.org/ENPlanWorkReasonTypeController/action/ENPlanWorkReasonTypeController.%operationName%');


end.

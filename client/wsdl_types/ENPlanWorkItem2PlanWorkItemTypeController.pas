unit ENPlanWorkItem2PlanWorkItemTypeController;

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

  ENPlanWorkItem2PlanWorkItemType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanWorkItem2PlanWorkItemTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanWorkItem2PlanWorkItemType = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENPlanWorkItem2PlanWorkItemTypeFilter = class(TRemotable)
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

  ENPlanWorkItem2PlanWorkItemTypeFilter = class(ENPlanWorkItem2PlanWorkItemType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENPlanWorkItem2PlanWorkItemTypeShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENPlanWorkItem2PlanWorkItemTypeShort = array of ENPlanWorkItem2PlanWorkItemTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENPlanWorkItem2PlanWorkItemTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENPlanWorkItem2PlanWorkItemTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENPlanWorkItem2PlanWorkItemTypeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENPlanWorkItem2PlanWorkItemTypeController/message/
  // soapAction: http://ksoe.org/ENPlanWorkItem2PlanWorkItemTypeController/action/ENPlanWorkItem2PlanWorkItemTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENPlanWorkItem2PlanWorkItemTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENPlanWorkItem2PlanWorkItemTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENPlanWorkItem2PlanWorkItemTypeControllerSoapPort = interface(IInvokable)
  ['{12021202-1202-1202-1202-120212021202}']
    function  add(const aENPlanWorkItem2PlanWorkItemType: ENPlanWorkItem2PlanWorkItemType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENPlanWorkItem2PlanWorkItemType: ENPlanWorkItem2PlanWorkItemType); stdcall;
    function  getObject(const anObjectCode: Integer): ENPlanWorkItem2PlanWorkItemType; stdcall;
    function  getList: ENPlanWorkItem2PlanWorkItemTypeShortList; stdcall;
    function  getFilteredList(const aENPlanWorkItem2PlanWorkItemTypeFilter: ENPlanWorkItem2PlanWorkItemTypeFilter): ENPlanWorkItem2PlanWorkItemTypeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENPlanWorkItem2PlanWorkItemTypeShortList; stdcall;
    function  getScrollableFilteredList(const aENPlanWorkItem2PlanWorkItemTypeFilter: ENPlanWorkItem2PlanWorkItemTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENPlanWorkItem2PlanWorkItemTypeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENPlanWorkItem2PlanWorkItemTypeShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENPlanWorkItem2PlanWorkItemTypeFilter: ENPlanWorkItem2PlanWorkItemTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor ENPlanWorkItem2PlanWorkItemTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENPlanWorkItem2PlanWorkItemType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkItem2PlanWorkItemType');
  RemClassRegistry.RegisterXSClass(ENPlanWorkItem2PlanWorkItemTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkItem2PlanWorkItemTypeRef');
  RemClassRegistry.RegisterXSClass(ENPlanWorkItem2PlanWorkItemTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkItem2PlanWorkItemTypeFilter');
  RemClassRegistry.RegisterXSClass(ENPlanWorkItem2PlanWorkItemTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkItem2PlanWorkItemTypeShort');
  RemClassRegistry.RegisterXSClass(ENPlanWorkItem2PlanWorkItemTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkItem2PlanWorkItemTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENPlanWorkItem2PlanWorkItemTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENPlanWorkItem2PlanWorkItemTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENPlanWorkItem2PlanWorkItemTypeControllerSoapPort), 'http://ksoe.org/ENPlanWorkItem2PlanWorkItemTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENPlanWorkItem2PlanWorkItemTypeControllerSoapPort), 'http://ksoe.org/ENPlanWorkItem2PlanWorkItemTypeController/action/ENPlanWorkItem2PlanWorkItemTypeController.%operationName%');


end.

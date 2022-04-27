unit ENPlanWorkSourceController;

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

  ENPlanWorkSource            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanWorkSourceRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanWorkSource = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENPlanWorkSourceFilter = class(TRemotable)
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

  ENPlanWorkSourceFilter = class(ENPlanWorkSource)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENPlanWorkSourceShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENPlanWorkSourceShort = array of ENPlanWorkSourceShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENPlanWorkSourceShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENPlanWorkSourceShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENPlanWorkSourceShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENPlanWorkSourceController/message/
  // soapAction: http://ksoe.org/ENPlanWorkSourceController/action/ENPlanWorkSourceController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENPlanWorkSourceControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENPlanWorkSourceController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENPlanWorkSourceControllerSoapPort = interface(IInvokable)
  ['{cb42cb42-cb42-cb42-cb42-cb42cb42cb42}']
    function  add(const aENPlanWorkSource: ENPlanWorkSource): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENPlanWorkSource: ENPlanWorkSource); stdcall;
    function  getObject(const anObjectCode: Integer): ENPlanWorkSource; stdcall;
    function  getList: ENPlanWorkSourceShortList; stdcall;
    function  getFilteredList(const aENPlanWorkSourceFilter: ENPlanWorkSourceFilter): ENPlanWorkSourceShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENPlanWorkSourceShortList; stdcall;
    function  getScrollableFilteredList(const aENPlanWorkSourceFilter: ENPlanWorkSourceFilter; const aFromPosition: Integer; const aQuantity: Integer): ENPlanWorkSourceShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENPlanWorkSourceShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENPlanWorkSourceFilter: ENPlanWorkSourceFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor ENPlanWorkSourceShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENPlanWorkSource, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkSource');
  RemClassRegistry.RegisterXSClass(ENPlanWorkSourceRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkSourceRef');
  RemClassRegistry.RegisterXSClass(ENPlanWorkSourceFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkSourceFilter');
  RemClassRegistry.RegisterXSClass(ENPlanWorkSourceShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkSourceShort');
  RemClassRegistry.RegisterXSClass(ENPlanWorkSourceShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkSourceShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENPlanWorkSourceShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENPlanWorkSourceShort');

  InvRegistry.RegisterInterface(TypeInfo(ENPlanWorkSourceControllerSoapPort), 'http://ksoe.org/ENPlanWorkSourceController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENPlanWorkSourceControllerSoapPort), 'http://ksoe.org/ENPlanWorkSourceController/action/ENPlanWorkSourceController.%operationName%');


end.

unit ENEstimateItemTypeController;

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

  ENEstimateItemType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENEstimateItemTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENEstimateItemType = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;

  ENEstimateItemTypeFilter = class(TRemotable)
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


  ENEstimateItemTypeShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENEstimateItemTypeShort = array of ENEstimateItemTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENEstimateItemTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENEstimateItemTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENEstimateItemTypeShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENEstimateItemTypeController/message/
  // soapAction: http://ksoe.org/ENEstimateItemTypeController/action/ENEstimateItemTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENEstimateItemTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENEstimateItemTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENEstimateItemTypeControllerSoapPort = interface(IInvokable)
  ['{cc74cc74-cc74-cc74-cc74-cc74cc74cc74}']
    function  add(const aENEstimateItemType: ENEstimateItemType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENEstimateItemType: ENEstimateItemType); stdcall;
    function  getObject(const anObjectCode: Integer): ENEstimateItemType; stdcall;
    function  getList: ENEstimateItemTypeShortList; stdcall;
    function  getFilteredList(const aENEstimateItemTypeFilter: ENEstimateItemTypeFilter): ENEstimateItemTypeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENEstimateItemTypeShortList; stdcall;
    function  getScrollableFilteredList(const aENEstimateItemTypeFilter: ENEstimateItemTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENEstimateItemTypeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENEstimateItemTypeShortList; stdcall;
  end; 


implementation

  
  
  destructor ENEstimateItemTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENEstimateItemType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEstimateItemType');
  RemClassRegistry.RegisterXSClass(ENEstimateItemTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEstimateItemTypeRef');
  RemClassRegistry.RegisterXSClass(ENEstimateItemTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEstimateItemTypeFilter');
  RemClassRegistry.RegisterXSClass(ENEstimateItemTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEstimateItemTypeShort');
  RemClassRegistry.RegisterXSClass(ENEstimateItemTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEstimateItemTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENEstimateItemTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENEstimateItemTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENEstimateItemTypeControllerSoapPort), 'http://ksoe.org/ENEstimateItemTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENEstimateItemTypeControllerSoapPort), 'http://ksoe.org/ENEstimateItemTypeController/action/ENEstimateItemTypeController.%operationName%');


end.

unit ENMolTypeController;

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

  ENMolType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENMolTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENMolType = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENMolTypeFilter = class(TRemotable)
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

  ENMolTypeFilter = class(ENMolType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENMolTypeShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENMolTypeShort = array of ENMolTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENMolTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENMolTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENMolTypeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENMolTypeController/message/
  // soapAction: http://ksoe.org/ENMolTypeController/action/ENMolTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENMolTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENMolTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENMolTypeControllerSoapPort = interface(IInvokable)
  ['{71e671e6-71e6-71e6-71e6-71e671e671e6}']
    function  add(const aENMolType: ENMolType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENMolType: ENMolType); stdcall;
    function  getObject(const anObjectCode: Integer): ENMolType; stdcall;
    function  getList: ENMolTypeShortList; stdcall;
    function  getFilteredList(const aENMolTypeFilter: ENMolTypeFilter): ENMolTypeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENMolTypeShortList; stdcall;
    function  getScrollableFilteredList(const aENMolTypeFilter: ENMolTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENMolTypeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENMolTypeShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENMolTypeFilter: ENMolTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor ENMolTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENMolType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMolType');
  RemClassRegistry.RegisterXSClass(ENMolTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMolTypeRef');
  RemClassRegistry.RegisterXSClass(ENMolTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMolTypeFilter');
  RemClassRegistry.RegisterXSClass(ENMolTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMolTypeShort');
  RemClassRegistry.RegisterXSClass(ENMolTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMolTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENMolTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENMolTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENMolTypeControllerSoapPort), 'http://ksoe.org/ENMolTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENMolTypeControllerSoapPort), 'http://ksoe.org/ENMolTypeController/action/ENMolTypeController.%operationName%');


end.

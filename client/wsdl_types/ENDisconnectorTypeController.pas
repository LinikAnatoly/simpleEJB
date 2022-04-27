unit ENDisconnectorTypeController;

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

  ENDisconnectorType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDisconnectorTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDisconnectorType = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENDisconnectorTypeFilter = class(TRemotable)
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

  ENDisconnectorTypeFilter = class(ENDisconnectorType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENDisconnectorTypeShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENDisconnectorTypeShort = array of ENDisconnectorTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENDisconnectorTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENDisconnectorTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENDisconnectorTypeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENDisconnectorTypeController/message/
  // soapAction: http://ksoe.org/ENDisconnectorTypeController/action/ENDisconnectorTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENDisconnectorTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENDisconnectorTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENDisconnectorTypeControllerSoapPort = interface(IInvokable)
  ['{e681e681-e681-e681-e681-e681e681e681}']
    function  add(const aENDisconnectorType: ENDisconnectorType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENDisconnectorType: ENDisconnectorType); stdcall;
    function  getObject(const anObjectCode: Integer): ENDisconnectorType; stdcall;
    function  getList: ENDisconnectorTypeShortList; stdcall;
    function  getFilteredList(const aENDisconnectorTypeFilter: ENDisconnectorTypeFilter): ENDisconnectorTypeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENDisconnectorTypeShortList; stdcall;
    function  getScrollableFilteredList(const aENDisconnectorTypeFilter: ENDisconnectorTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENDisconnectorTypeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENDisconnectorTypeShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENDisconnectorTypeFilter: ENDisconnectorTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor ENDisconnectorTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENDisconnectorType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDisconnectorType');
  RemClassRegistry.RegisterXSClass(ENDisconnectorTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDisconnectorTypeRef');
  RemClassRegistry.RegisterXSClass(ENDisconnectorTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDisconnectorTypeFilter');
  RemClassRegistry.RegisterXSClass(ENDisconnectorTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDisconnectorTypeShort');
  RemClassRegistry.RegisterXSClass(ENDisconnectorTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDisconnectorTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENDisconnectorTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENDisconnectorTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENDisconnectorTypeControllerSoapPort), 'http://ksoe.org/ENDisconnectorTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENDisconnectorTypeControllerSoapPort), 'http://ksoe.org/ENDisconnectorTypeController/action/ENDisconnectorTypeController.%operationName%');


end.

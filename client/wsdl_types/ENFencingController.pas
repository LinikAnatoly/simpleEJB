unit ENFencingController;

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

  ENFencing            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENFencingRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENFencing = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENFencingFilter = class(TRemotable)
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

  ENFencingFilter = class(ENFencing)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENFencingShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENFencingShort = array of ENFencingShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENFencingShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENFencingShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENFencingShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENFencingController/message/
  // soapAction: http://ksoe.org/ENFencingController/action/ENFencingController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENFencingControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENFencingController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENFencingControllerSoapPort = interface(IInvokable)
  ['{1f391f39-1f39-1f39-1f39-1f391f391f39}']
    function  add(const aENFencing: ENFencing): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENFencing: ENFencing); stdcall;
    function  getObject(const anObjectCode: Integer): ENFencing; stdcall;
    function  getList: ENFencingShortList; stdcall;
    function  getFilteredList(const aENFencingFilter: ENFencingFilter): ENFencingShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENFencingShortList; stdcall;
    function  getScrollableFilteredList(const aENFencingFilter: ENFencingFilter; const aFromPosition: Integer; const aQuantity: Integer): ENFencingShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENFencingShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENFencingFilter: ENFencingFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor ENFencingShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENFencing, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFencing');
  RemClassRegistry.RegisterXSClass(ENFencingRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFencingRef');
  RemClassRegistry.RegisterXSClass(ENFencingFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFencingFilter');
  RemClassRegistry.RegisterXSClass(ENFencingShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFencingShort');
  RemClassRegistry.RegisterXSClass(ENFencingShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFencingShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENFencingShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENFencingShort');

  InvRegistry.RegisterInterface(TypeInfo(ENFencingControllerSoapPort), 'http://ksoe.org/ENFencingController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENFencingControllerSoapPort), 'http://ksoe.org/ENFencingController/action/ENFencingController.%operationName%');


end.

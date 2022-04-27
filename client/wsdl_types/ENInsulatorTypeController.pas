unit ENInsulatorTypeController;

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

  ENInsulatorType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENInsulatorTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENInsulatorType = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENInsulatorTypeFilter = class(TRemotable)
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

  ENInsulatorTypeFilter = class(ENInsulatorType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENInsulatorTypeShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENInsulatorTypeShort = array of ENInsulatorTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENInsulatorTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENInsulatorTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENInsulatorTypeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENInsulatorTypeController/message/
  // soapAction: http://ksoe.org/ENInsulatorTypeController/action/ENInsulatorTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENInsulatorTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENInsulatorTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENInsulatorTypeControllerSoapPort = interface(IInvokable)
  ['{19881988-1988-1988-1988-198819881988}']
    function  add(const aENInsulatorType: ENInsulatorType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENInsulatorType: ENInsulatorType); stdcall;
    function  getObject(const anObjectCode: Integer): ENInsulatorType; stdcall;
    function  getList: ENInsulatorTypeShortList; stdcall;
    function  getFilteredList(const aENInsulatorTypeFilter: ENInsulatorTypeFilter): ENInsulatorTypeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENInsulatorTypeShortList; stdcall;
    function  getScrollableFilteredList(const aENInsulatorTypeFilter: ENInsulatorTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENInsulatorTypeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENInsulatorTypeShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENInsulatorTypeFilter: ENInsulatorTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor ENInsulatorTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENInsulatorType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENInsulatorType');
  RemClassRegistry.RegisterXSClass(ENInsulatorTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENInsulatorTypeRef');
  RemClassRegistry.RegisterXSClass(ENInsulatorTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENInsulatorTypeFilter');
  RemClassRegistry.RegisterXSClass(ENInsulatorTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENInsulatorTypeShort');
  RemClassRegistry.RegisterXSClass(ENInsulatorTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENInsulatorTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENInsulatorTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENInsulatorTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENInsulatorTypeControllerSoapPort), 'http://ksoe.org/ENInsulatorTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENInsulatorTypeControllerSoapPort), 'http://ksoe.org/ENInsulatorTypeController/action/ENInsulatorTypeController.%operationName%');


end.

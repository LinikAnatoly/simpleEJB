unit ENAutomatTypeController;

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

  ENAutomatType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENAutomatTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENAutomatType = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENAutomatTypeFilter = class(TRemotable)
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

  ENAutomatTypeFilter = class(ENAutomatType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENAutomatTypeShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENAutomatTypeShort = array of ENAutomatTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENAutomatTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENAutomatTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENAutomatTypeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENAutomatTypeController/message/
  // soapAction: http://ksoe.org/ENAutomatTypeController/action/ENAutomatTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENAutomatTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENAutomatTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENAutomatTypeControllerSoapPort = interface(IInvokable)
  ['{15a715a7-15a7-15a7-15a7-15a715a715a7}']
    function  add(const aENAutomatType: ENAutomatType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENAutomatType: ENAutomatType); stdcall;
    function  getObject(const anObjectCode: Integer): ENAutomatType; stdcall;
    function  getList: ENAutomatTypeShortList; stdcall;
    function  getFilteredList(const aENAutomatTypeFilter: ENAutomatTypeFilter): ENAutomatTypeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENAutomatTypeShortList; stdcall;
    function  getScrollableFilteredList(const aENAutomatTypeFilter: ENAutomatTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENAutomatTypeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENAutomatTypeShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENAutomatTypeFilter: ENAutomatTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor ENAutomatTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENAutomatType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAutomatType');
  RemClassRegistry.RegisterXSClass(ENAutomatTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAutomatTypeRef');
  RemClassRegistry.RegisterXSClass(ENAutomatTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAutomatTypeFilter');
  RemClassRegistry.RegisterXSClass(ENAutomatTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAutomatTypeShort');
  RemClassRegistry.RegisterXSClass(ENAutomatTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAutomatTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENAutomatTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENAutomatTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENAutomatTypeControllerSoapPort), 'http://ksoe.org/ENAutomatTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENAutomatTypeControllerSoapPort), 'http://ksoe.org/ENAutomatTypeController/action/ENAutomatTypeController.%operationName%');


end.

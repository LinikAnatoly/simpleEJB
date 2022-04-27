unit ENPanelTypeController;

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

  ENPanelType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPanelTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPanelType = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENPanelTypeFilter = class(TRemotable)
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

  ENPanelTypeFilter = class(ENPanelType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENPanelTypeShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENPanelTypeShort = array of ENPanelTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENPanelTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENPanelTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENPanelTypeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENPanelTypeController/message/
  // soapAction: http://ksoe.org/ENPanelTypeController/action/ENPanelTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENPanelTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENPanelTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENPanelTypeControllerSoapPort = interface(IInvokable)
  ['{b3d2b3d2-b3d2-b3d2-b3d2-b3d2b3d2b3d2}']
    function  add(const aENPanelType: ENPanelType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENPanelType: ENPanelType); stdcall;
    function  getObject(const anObjectCode: Integer): ENPanelType; stdcall;
    function  getList: ENPanelTypeShortList; stdcall;
    function  getFilteredList(const aENPanelTypeFilter: ENPanelTypeFilter): ENPanelTypeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENPanelTypeShortList; stdcall;
    function  getScrollableFilteredList(const aENPanelTypeFilter: ENPanelTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENPanelTypeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENPanelTypeShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENPanelTypeFilter: ENPanelTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor ENPanelTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENPanelType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPanelType');
  RemClassRegistry.RegisterXSClass(ENPanelTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPanelTypeRef');
  RemClassRegistry.RegisterXSClass(ENPanelTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPanelTypeFilter');
  RemClassRegistry.RegisterXSClass(ENPanelTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPanelTypeShort');
  RemClassRegistry.RegisterXSClass(ENPanelTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPanelTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENPanelTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENPanelTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENPanelTypeControllerSoapPort), 'http://ksoe.org/ENPanelTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENPanelTypeControllerSoapPort), 'http://ksoe.org/ENPanelTypeController/action/ENPanelTypeController.%operationName%');


end.

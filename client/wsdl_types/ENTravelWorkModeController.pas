unit ENTravelWorkModeController;

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

  ENTravelWorkMode            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTravelWorkModeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTravelWorkMode = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENTravelWorkModeFilter = class(TRemotable)
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

  ENTravelWorkModeFilter = class(ENTravelWorkMode)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENTravelWorkModeShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENTravelWorkModeShort = array of ENTravelWorkModeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENTravelWorkModeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENTravelWorkModeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENTravelWorkModeShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENTravelWorkModeController/message/
  // soapAction: http://ksoe.org/ENTravelWorkModeController/action/ENTravelWorkModeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENTravelWorkModeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENTravelWorkModeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENTravelWorkModeControllerSoapPort = interface(IInvokable)
  ['{13961396-1396-1396-1396-139613961396}']
    function  add(const aENTravelWorkMode: ENTravelWorkMode): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENTravelWorkMode: ENTravelWorkMode); stdcall;
    function  getObject(const anObjectCode: Integer): ENTravelWorkMode; stdcall;
    function  getList: ENTravelWorkModeShortList; stdcall;
    function  getFilteredList(const aENTravelWorkModeFilter: ENTravelWorkModeFilter): ENTravelWorkModeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENTravelWorkModeShortList; stdcall;
    function  getScrollableFilteredList(const aENTravelWorkModeFilter: ENTravelWorkModeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENTravelWorkModeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENTravelWorkModeShortList; stdcall;
  end; 


implementation


  
  destructor ENTravelWorkModeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENTravelWorkMode, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelWorkMode');
  RemClassRegistry.RegisterXSClass(ENTravelWorkModeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelWorkModeRef');
  RemClassRegistry.RegisterXSClass(ENTravelWorkModeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelWorkModeFilter');
  RemClassRegistry.RegisterXSClass(ENTravelWorkModeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelWorkModeShort');
  RemClassRegistry.RegisterXSClass(ENTravelWorkModeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelWorkModeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENTravelWorkModeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENTravelWorkModeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENTravelWorkModeControllerSoapPort), 'http://ksoe.org/ENTravelWorkModeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENTravelWorkModeControllerSoapPort), 'http://ksoe.org/ENTravelWorkModeController/action/ENTravelWorkModeController.%operationName%');


end.

unit ENTravelSheetStatusController;

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

  ENTravelSheetStatus            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTravelSheetStatusRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTravelSheetStatus = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENTravelSheetStatusFilter = class(TRemotable)
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

  ENTravelSheetStatusFilter = class(ENTravelSheetStatus)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENTravelSheetStatusShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENTravelSheetStatusShort = array of ENTravelSheetStatusShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENTravelSheetStatusShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENTravelSheetStatusShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENTravelSheetStatusShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENTravelSheetStatusController/message/
  // soapAction: http://ksoe.org/ENTravelSheetStatusController/action/ENTravelSheetStatusController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENTravelSheetStatusControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENTravelSheetStatusController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENTravelSheetStatusControllerSoapPort = interface(IInvokable)
  ['{1d431d43-1d43-1d43-1d43-1d431d431d43}']
    function  add(const aENTravelSheetStatus: ENTravelSheetStatus): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENTravelSheetStatus: ENTravelSheetStatus); stdcall;
    function  getObject(const anObjectCode: Integer): ENTravelSheetStatus; stdcall;
    function  getList: ENTravelSheetStatusShortList; stdcall;
    function  getFilteredList(const aENTravelSheetStatusFilter: ENTravelSheetStatusFilter): ENTravelSheetStatusShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENTravelSheetStatusShortList; stdcall;
    function  getScrollableFilteredList(const aENTravelSheetStatusFilter: ENTravelSheetStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ENTravelSheetStatusShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENTravelSheetStatusShortList; stdcall;
  end; 


implementation


  
  destructor ENTravelSheetStatusShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENTravelSheetStatus, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelSheetStatus');
  RemClassRegistry.RegisterXSClass(ENTravelSheetStatusRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelSheetStatusRef');
  RemClassRegistry.RegisterXSClass(ENTravelSheetStatusFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelSheetStatusFilter');
  RemClassRegistry.RegisterXSClass(ENTravelSheetStatusShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelSheetStatusShort');
  RemClassRegistry.RegisterXSClass(ENTravelSheetStatusShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelSheetStatusShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENTravelSheetStatusShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENTravelSheetStatusShort');

  InvRegistry.RegisterInterface(TypeInfo(ENTravelSheetStatusControllerSoapPort), 'http://ksoe.org/ENTravelSheetStatusController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENTravelSheetStatusControllerSoapPort), 'http://ksoe.org/ENTravelSheetStatusController/action/ENTravelSheetStatusController.%operationName%');


end.

unit ENTravelSheetItemStatusController;

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

  ENTravelSheetItemStatus            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTravelSheetItemStatusRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTravelSheetItemStatus = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENTravelSheetItemStatusFilter = class(TRemotable)
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

  ENTravelSheetItemStatusFilter = class(ENTravelSheetItemStatus)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENTravelSheetItemStatusShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENTravelSheetItemStatusShort = array of ENTravelSheetItemStatusShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENTravelSheetItemStatusShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENTravelSheetItemStatusShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENTravelSheetItemStatusShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENTravelSheetItemStatusController/message/
  // soapAction: http://ksoe.org/ENTravelSheetItemStatusController/action/ENTravelSheetItemStatusController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENTravelSheetItemStatusControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENTravelSheetItemStatusController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENTravelSheetItemStatusControllerSoapPort = interface(IInvokable)
  ['{4daa4daa-4daa-4daa-4daa-4daa4daa4daa}']
    function  add(const aENTravelSheetItemStatus: ENTravelSheetItemStatus): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENTravelSheetItemStatus: ENTravelSheetItemStatus); stdcall;
    function  getObject(const anObjectCode: Integer): ENTravelSheetItemStatus; stdcall;
    function  getList: ENTravelSheetItemStatusShortList; stdcall;
    function  getFilteredList(const aENTravelSheetItemStatusFilter: ENTravelSheetItemStatusFilter): ENTravelSheetItemStatusShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENTravelSheetItemStatusShortList; stdcall;
    function  getScrollableFilteredList(const aENTravelSheetItemStatusFilter: ENTravelSheetItemStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ENTravelSheetItemStatusShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENTravelSheetItemStatusShortList; stdcall;
  end; 


implementation


  
  destructor ENTravelSheetItemStatusShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENTravelSheetItemStatus, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelSheetItemStatus');
  RemClassRegistry.RegisterXSClass(ENTravelSheetItemStatusRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelSheetItemStatusRef');
  RemClassRegistry.RegisterXSClass(ENTravelSheetItemStatusFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelSheetItemStatusFilter');
  RemClassRegistry.RegisterXSClass(ENTravelSheetItemStatusShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelSheetItemStatusShort');
  RemClassRegistry.RegisterXSClass(ENTravelSheetItemStatusShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelSheetItemStatusShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENTravelSheetItemStatusShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENTravelSheetItemStatusShort');

  InvRegistry.RegisterInterface(TypeInfo(ENTravelSheetItemStatusControllerSoapPort), 'http://ksoe.org/ENTravelSheetItemStatusController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENTravelSheetItemStatusControllerSoapPort), 'http://ksoe.org/ENTravelSheetItemStatusController/action/ENTravelSheetItemStatusController.%operationName%');


end.

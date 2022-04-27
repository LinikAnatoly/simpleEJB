unit ENTravelSheetItemKindController;

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

  ENTravelSheetItemKind            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTravelSheetItemKindRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTravelSheetItemKind = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENTravelSheetItemKindFilter = class(TRemotable)
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

  ENTravelSheetItemKindFilter = class(ENTravelSheetItemKind)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENTravelSheetItemKindShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENTravelSheetItemKindShort = array of ENTravelSheetItemKindShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENTravelSheetItemKindShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENTravelSheetItemKindShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENTravelSheetItemKindShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENTravelSheetItemKindController/message/
  // soapAction: http://ksoe.org/ENTravelSheetItemKindController/action/ENTravelSheetItemKindController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENTravelSheetItemKindControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENTravelSheetItemKindController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENTravelSheetItemKindControllerSoapPort = interface(IInvokable)
  ['{2cb42cb4-2cb4-2cb4-2cb4-2cb42cb42cb4}']
    function  add(const aENTravelSheetItemKind: ENTravelSheetItemKind): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENTravelSheetItemKind: ENTravelSheetItemKind); stdcall;
    function  getObject(const anObjectCode: Integer): ENTravelSheetItemKind; stdcall;
    function  getList: ENTravelSheetItemKindShortList; stdcall;
    function  getFilteredList(const aENTravelSheetItemKindFilter: ENTravelSheetItemKindFilter): ENTravelSheetItemKindShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENTravelSheetItemKindShortList; stdcall;
    function  getScrollableFilteredList(const aENTravelSheetItemKindFilter: ENTravelSheetItemKindFilter; const aFromPosition: Integer; const aQuantity: Integer): ENTravelSheetItemKindShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENTravelSheetItemKindShortList; stdcall;
  end; 


implementation


  
  destructor ENTravelSheetItemKindShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENTravelSheetItemKind, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelSheetItemKind');
  RemClassRegistry.RegisterXSClass(ENTravelSheetItemKindRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelSheetItemKindRef');
  RemClassRegistry.RegisterXSClass(ENTravelSheetItemKindFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelSheetItemKindFilter');
  RemClassRegistry.RegisterXSClass(ENTravelSheetItemKindShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelSheetItemKindShort');
  RemClassRegistry.RegisterXSClass(ENTravelSheetItemKindShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelSheetItemKindShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENTravelSheetItemKindShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENTravelSheetItemKindShort');

  InvRegistry.RegisterInterface(TypeInfo(ENTravelSheetItemKindControllerSoapPort), 'http://ksoe.org/ENTravelSheetItemKindController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENTravelSheetItemKindControllerSoapPort), 'http://ksoe.org/ENTravelSheetItemKindController/action/ENTravelSheetItemKindController.%operationName%');


end.

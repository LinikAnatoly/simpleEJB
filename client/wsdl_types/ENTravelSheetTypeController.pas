unit ENTravelSheetTypeController;

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

  ENTravelSheetType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTravelSheetTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTravelSheetType = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENTravelSheetTypeFilter = class(TRemotable)
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

  ENTravelSheetTypeFilter = class(ENTravelSheetType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENTravelSheetTypeShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENTravelSheetTypeShort = array of ENTravelSheetTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENTravelSheetTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENTravelSheetTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENTravelSheetTypeShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENTravelSheetTypeController/message/
  // soapAction: http://ksoe.org/ENTravelSheetTypeController/action/ENTravelSheetTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENTravelSheetTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENTravelSheetTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENTravelSheetTypeControllerSoapPort = interface(IInvokable)
  ['{c118c118-c118-c118-c118-c118c118c118}']
    function  add(const aENTravelSheetType: ENTravelSheetType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENTravelSheetType: ENTravelSheetType); stdcall;
    function  getObject(const anObjectCode: Integer): ENTravelSheetType; stdcall;
    function  getList: ENTravelSheetTypeShortList; stdcall;
    function  getFilteredList(const aENTravelSheetTypeFilter: ENTravelSheetTypeFilter): ENTravelSheetTypeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENTravelSheetTypeShortList; stdcall;
    function  getScrollableFilteredList(const aENTravelSheetTypeFilter: ENTravelSheetTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENTravelSheetTypeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENTravelSheetTypeShortList; stdcall;
  end; 


implementation


  
  destructor ENTravelSheetTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENTravelSheetType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelSheetType');
  RemClassRegistry.RegisterXSClass(ENTravelSheetTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelSheetTypeRef');
  RemClassRegistry.RegisterXSClass(ENTravelSheetTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelSheetTypeFilter');
  RemClassRegistry.RegisterXSClass(ENTravelSheetTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelSheetTypeShort');
  RemClassRegistry.RegisterXSClass(ENTravelSheetTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelSheetTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENTravelSheetTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENTravelSheetTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENTravelSheetTypeControllerSoapPort), 'http://ksoe.org/ENTravelSheetTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENTravelSheetTypeControllerSoapPort), 'http://ksoe.org/ENTravelSheetTypeController/action/ENTravelSheetTypeController.%operationName%');


end.

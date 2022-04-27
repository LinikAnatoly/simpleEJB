unit ENMarkEstimateController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENMarkController 
   ,ENEstimateItemController 
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

  ENMarkEstimate            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENMarkEstimateRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENMarkEstimate = class(TRemotable)
  private
    Fcode : Integer; 
    FuserName : WideString;
//???
    Fmark : ENMark;
//???
    FestimateItem : ENEstimateItem;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property userName : WideString read FuserName write FuserName;
    property mark : ENMark read Fmark write Fmark; 
    property estimateItem : ENEstimateItem read FestimateItem write FestimateItem; 
  end;
  
{
  ENMarkEstimateFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FuserName : WideString;
//???
    Fmark : ENMark;
//???
    FestimateItem : ENEstimateItem;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property userName : WideString read FuserName write FuserName;
    property mark : ENMark read Fmark write Fmark; 
    property estimateItem : ENEstimateItem read FestimateItem write FestimateItem; 
  end;
}

  ENMarkEstimateFilter = class(ENMarkEstimate)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENMarkEstimateShort = class(TRemotable)
  private
    Fcode : Integer; 
    FuserName : WideString;
    FmarkCode : Integer; 
    FmarkName : WideString;
    FestimateItemCode : Integer; 
  published
    property  code : Integer read Fcode write Fcode; 
    property userName : WideString read FuserName write FuserName;
    property markCode : Integer read FmarkCode write FmarkCode;
    property markName : WideString read FmarkName write FmarkName;
    property estimateItemCode : Integer read FestimateItemCode write FestimateItemCode; //ENEstimateItemRef read FestimateItemCode write FestimateItemCode; 
  end;

  ArrayOfENMarkEstimateShort = array of ENMarkEstimateShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENMarkEstimateShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENMarkEstimateShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENMarkEstimateShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENMarkEstimateController/message/
  // soapAction: http://ksoe.org/ENMarkEstimateController/action/ENMarkEstimateController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENMarkEstimateControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENMarkEstimateController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENMarkEstimateControllerSoapPort = interface(IInvokable)
  ['{b87db87d-b87d-b87d-b87d-b87db87db87d}']
    function  add(const aENMarkEstimate: ENMarkEstimate): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENMarkEstimate: ENMarkEstimate); stdcall;
    function  getObject(const anObjectCode: Integer): ENMarkEstimate; stdcall;
    function  getList: ENMarkEstimateShortList; stdcall;
    function  getFilteredList(const aENMarkEstimateFilter: ENMarkEstimateFilter): ENMarkEstimateShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENMarkEstimateShortList; stdcall;
    function  getScrollableFilteredList(const aENMarkEstimateFilter: ENMarkEstimateFilter; const aFromPosition: Integer; const aQuantity: Integer): ENMarkEstimateShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENMarkEstimateShortList; stdcall;
  end; 


implementation

  destructor ENMarkEstimate.Destroy;
  begin
    if Assigned(Fmark) then
      mark.Free;
    if Assigned(FestimateItem) then
      estimateItem.Free;
    inherited Destroy;
  end;

{  
  destructor ENMarkEstimateFilter.Destroy;
  begin
    if Assigned(Fmark) then
      mark.Free;
    if Assigned(FestimateItem) then
      estimateItem.Free;
    inherited Destroy;
  end; 
}

  destructor ENMarkEstimateFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  
  destructor ENMarkEstimateShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENMarkEstimate, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMarkEstimate');
  RemClassRegistry.RegisterXSClass(ENMarkEstimateRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMarkEstimateRef');
  RemClassRegistry.RegisterXSClass(ENMarkEstimateFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMarkEstimateFilter');
  RemClassRegistry.RegisterXSClass(ENMarkEstimateShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMarkEstimateShort');
  RemClassRegistry.RegisterXSClass(ENMarkEstimateShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMarkEstimateShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENMarkEstimateShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENMarkEstimateShort');

  InvRegistry.RegisterInterface(TypeInfo(ENMarkEstimateControllerSoapPort), 'http://ksoe.org/ENMarkEstimateController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENMarkEstimateControllerSoapPort), 'http://ksoe.org/ENMarkEstimateController/action/ENMarkEstimateController.%operationName%');


end.

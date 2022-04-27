unit ENAirCrossingItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENPostController 
   ,ENAirCrossingController 
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

  ENAirCrossingItem            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENAirCrossingItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENAirCrossingItem = class(TRemotable)
  private
    Fcode : Integer; 
    Fmodify_time : Int64;
//???
    FpostRef : ENPostRef;
//???
    FairCrossingRef : ENAirCrossingRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property postRef : ENPostRef read FpostRef write FpostRef; 
    property airCrossingRef : ENAirCrossingRef read FairCrossingRef write FairCrossingRef; 
  end;
  
{
  ENAirCrossingItemFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fmodify_time : Int64;
//???
    FpostRef : ENPostRef;
//???
    FairCrossingRef : ENAirCrossingRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property postRef : ENPostRef read FpostRef write FpostRef; 
    property airCrossingRef : ENAirCrossingRef read FairCrossingRef write FairCrossingRef; 
  end;
}

  ENAirCrossingItemFilter = class(ENAirCrossingItem)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENAirCrossingItemShort = class(TRemotable)
  private
    Fcode : Integer; 
    FpostRefCode : Integer; 
    FpostRefName : WideString;
    FpostRefPostNumberGen : WideString;
    FpostRefLastRepairDate : TXSDate;
    FpostRefYearSetup: Integer;
    FpostRefWoodenLength: TXSDecimal;
    FpostRefTypeCode: Integer;
    FpostRefTypeName: WideString;
    FpostRefGroundCode: Integer;
    FpostRefGroundName: WideString;
    FpostRefElementCode: Integer;
    FpostRefMaterialRefCode: Integer;
    FpostRefMaterialRefName: WideString;
    FpostRefMaterialRefCost : TXSDecimal;
    FpostRefMaterialRefDeliveryDate : Integer;
    FpostRefMaterialRefNumkatalog : WideString;
    FpostRefMaterialRefIdentid : WideString;
    FairCrossingRefCode : Integer; 
    FairCrossingRefName : WideString;
    FairCrossingRefFlightLength : TXSDecimal;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 

    property postRefCode : Integer read FpostRefCode write FpostRefCode; 
    property postRefName : WideString read FpostRefName write FpostRefName; 
    property postRefPostNumberGen : WideString read FpostRefPostNumberGen write FpostRefPostNumberGen;
    property postRefLastRepairDate : TXSDate read FpostRefLastRepairDate write FpostRefLastRepairDate;
    property postRefYearSetup: Integer read FpostRefYearSetup write FpostRefYearSetup;
    property postRefWoodenLength: TXSDecimal read FpostRefWoodenLength write FpostRefWoodenLength;
    property postRefTypeCode: Integer read FpostRefTypeCode write FpostRefTypeCode;
    property postRefTypeName: WideString read FpostRefTypeName write FpostRefTypeName;
    property postRefGroundCode: Integer read FpostRefGroundCode write FpostRefGroundCode;
    property postRefGroundName: WideString read FpostRefGroundName write FpostRefGroundName;
    property postRefElementCode: Integer read FpostRefElementCode write FpostRefElementCode;
    property postRefMaterialRefCode: Integer read FpostRefMaterialRefCode write FpostRefMaterialRefCode;
    property postRefMaterialRefName: WideString read FpostRefMaterialRefName write FpostRefMaterialRefName;
    property postRefMaterialRefCost: TXSDecimal read FpostRefMaterialRefCost write FpostRefMaterialRefCost;
    property postRefMaterialRefDeliveryDate: Integer read FpostRefMaterialRefDeliveryDate write FpostRefMaterialRefDeliveryDate;
    property postRefMaterialRefNumkatalog: WideString read FpostRefMaterialRefNumkatalog write FpostRefMaterialRefNumkatalog;
    property postRefMaterialRefIdentid: WideString read FpostRefMaterialRefIdentid write FpostRefMaterialRefIdentid;
    property airCrossingRefCode : Integer read FairCrossingRefCode write FairCrossingRefCode; 
    property airCrossingRefName : WideString read FairCrossingRefName write FairCrossingRefName; 
    property airCrossingRefFlightLength : TXSDecimal read FairCrossingRefFlightLength write FairCrossingRefFlightLength; 
  end;

  ArrayOfENAirCrossingItemShort = array of ENAirCrossingItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENAirCrossingItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENAirCrossingItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENAirCrossingItemShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENAirCrossingItemController/message/
  // soapAction: http://ksoe.org/ENAirCrossingItemController/action/ENAirCrossingItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENAirCrossingItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENAirCrossingItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENAirCrossingItemControllerSoapPort = interface(IInvokable)
  ['{1f9c1f9c-1f9c-1f9c-1f9c-1f9c1f9c1f9c}']
    function  add(const aENAirCrossingItem: ENAirCrossingItem): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENAirCrossingItem: ENAirCrossingItem); stdcall;
    function  getObject(const anObjectCode: Integer): ENAirCrossingItem; stdcall;
    function  getList: ENAirCrossingItemShortList; stdcall;
    function  getFilteredList(const aENAirCrossingItemFilter: ENAirCrossingItemFilter): ENAirCrossingItemShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENAirCrossingItemShortList; stdcall;
    function  getScrollableFilteredList(const aENAirCrossingItemFilter: ENAirCrossingItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ENAirCrossingItemShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENAirCrossingItemShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENAirCrossingItemFilter: ENAirCrossingItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENAirCrossingItem.Destroy;
  begin
    if Assigned(FpostRef) then
      postRef.Free;
    if Assigned(FairCrossingRef) then
      airCrossingRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENAirCrossingItemFilter.Destroy;
  begin
    if Assigned(FpostRef) then
      postRef.Free;
    if Assigned(FairCrossingRef) then
      airCrossingRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENAirCrossingItemFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENAirCrossingItemShort.Destroy;
  begin
    if Assigned(FpostRefLastRepairDate) then
      postRefLastRepairDate.Free;
    if Assigned(FairCrossingRefFlightLength) then
      airCrossingRefFlightLength.Free;
    inherited Destroy;
  end; 
  
  destructor ENAirCrossingItemShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENAirCrossingItem, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAirCrossingItem');
  RemClassRegistry.RegisterXSClass(ENAirCrossingItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAirCrossingItemRef');
  RemClassRegistry.RegisterXSClass(ENAirCrossingItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAirCrossingItemFilter');
  RemClassRegistry.RegisterXSClass(ENAirCrossingItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAirCrossingItemShort');
  RemClassRegistry.RegisterXSClass(ENAirCrossingItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAirCrossingItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENAirCrossingItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENAirCrossingItemShort');

  InvRegistry.RegisterInterface(TypeInfo(ENAirCrossingItemControllerSoapPort), 'http://ksoe.org/ENAirCrossingItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENAirCrossingItemControllerSoapPort), 'http://ksoe.org/ENAirCrossingItemController/action/ENAirCrossingItemController.%operationName%');


end.

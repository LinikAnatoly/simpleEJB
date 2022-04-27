unit ENWiresItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENPostController 
   ,ENWiresController 
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

  ENWiresItem            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENWiresItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENWiresItem = class(TRemotable)
  private
    Fcode : Integer; 
    Fmodify_time : Int64;
//???
    FpostRef : ENPostRef;
//???
    FwiresRef : ENWiresRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property postRef : ENPostRef read FpostRef write FpostRef; 
    property wiresRef : ENWiresRef read FwiresRef write FwiresRef; 
  end;
  
{
  ENWiresItemFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fmodify_time : Int64;
//???
    FpostRef : ENPostRef;
//???
    FwiresRef : ENWiresRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property postRef : ENPostRef read FpostRef write FpostRef; 
    property wiresRef : ENWiresRef read FwiresRef write FwiresRef; 
  end;
}

  ENWiresItemFilter = class(ENWiresItem)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENWiresItemShort = class(TRemotable)
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
    FpostRefMaterialRefDeliveryDate: Integer;
    FpostRefMaterialRefNumkatalog: WideString;
    FpostRefMaterialRefIdentid: WideString;
    FwiresRefCode: Integer;
    FwiresRefNumberGen: WideString;
    FwiresRefCountWires: Integer;
    FwiresRefWireLength: TXSDecimal;
    FwiresRefExternOrg: WideString;
    FwiresRefIsCabel: Integer;
    FwiresRefMaterialRefCode: Integer;
    FwiresRefMaterialRefName: WideString;
    FwiresRefMaterialRefCost : TXSDecimal;
    FwiresRefMaterialRefDeliveryDate: Integer;
    FwiresRefMaterialRefNumkatalog: WideString;
    FwiresRefMaterialRefIdentid: WideString;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
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
    property wiresRefCode : Integer read FwiresRefCode write FwiresRefCode;
    property wiresRefNumberGen : WideString read FwiresRefNumberGen write FwiresRefNumberGen;
    property wiresRefCountWires : Integer read FwiresRefCountWires write FwiresRefCountWires;
    property wiresRefWireLength : TXSDecimal read FwiresRefWireLength write FwiresRefWireLength;
    property wiresRefExternOrg : WideString read FwiresRefExternOrg write FwiresRefExternOrg;
    property wiresRefIsCabel : Integer read FwiresRefIsCabel write FwiresRefIsCabel;
    property wiresRefMaterialRefCode: Integer read FwiresRefMaterialRefCode write FwiresRefMaterialRefCode;
    property wiresRefMaterialRefName: WideString read FwiresRefMaterialRefName write FwiresRefMaterialRefName;
    property wiresRefMaterialRefCost: TXSDecimal read FwiresRefMaterialRefCost write FwiresRefMaterialRefCost;
    property wiresRefMaterialRefDeliveryDate: Integer read FwiresRefMaterialRefDeliveryDate write FwiresRefMaterialRefDeliveryDate;
    property wiresRefMaterialRefNumkatalog: WideString read FwiresRefMaterialRefNumkatalog write FwiresRefMaterialRefNumkatalog;
    property wiresRefMaterialRefIdentid: WideString read FwiresRefMaterialRefIdentid write FwiresRefMaterialRefIdentid;
  end;

  ArrayOfENWiresItemShort = array of ENWiresItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENWiresItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENWiresItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENWiresItemShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENWiresItemController/message/
  // soapAction: http://ksoe.org/ENWiresItemController/action/ENWiresItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENWiresItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENWiresItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENWiresItemControllerSoapPort = interface(IInvokable)
  ['{b12fb12f-b12f-b12f-b12f-b12fb12fb12f}']
    function  add(const aENWiresItem: ENWiresItem): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENWiresItem: ENWiresItem); stdcall;
    function  getObject(const anObjectCode: Integer): ENWiresItem; stdcall;
    function  getList: ENWiresItemShortList; stdcall;
    function  getFilteredList(const aENWiresItemFilter: ENWiresItemFilter): ENWiresItemShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENWiresItemShortList; stdcall;
    function  getScrollableFilteredList(const aENWiresItemFilter: ENWiresItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ENWiresItemShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENWiresItemShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENWiresItemFilter: ENWiresItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENWiresItem.Destroy;
  begin
    if Assigned(FpostRef) then
      postRef.Free;
    if Assigned(FwiresRef) then
      wiresRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENWiresItemFilter.Destroy;
  begin
    if Assigned(FpostRef) then
      postRef.Free;
    if Assigned(FwiresRef) then
      wiresRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENWiresItemFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENWiresItemShort.Destroy;
  begin
    if Assigned(FpostRefLastRepairDate) then
      postRefLastRepairDate.Free;
    if Assigned(FwiresRefWireLength) then
      wiresRefWireLength.Free;
    inherited Destroy;
  end; 
  
  destructor ENWiresItemShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENWiresItem, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWiresItem');
  RemClassRegistry.RegisterXSClass(ENWiresItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWiresItemRef');
  RemClassRegistry.RegisterXSClass(ENWiresItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWiresItemFilter');
  RemClassRegistry.RegisterXSClass(ENWiresItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWiresItemShort');
  RemClassRegistry.RegisterXSClass(ENWiresItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWiresItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENWiresItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENWiresItemShort');

  InvRegistry.RegisterInterface(TypeInfo(ENWiresItemControllerSoapPort), 'http://ksoe.org/ENWiresItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENWiresItemControllerSoapPort), 'http://ksoe.org/ENWiresItemController/action/ENWiresItemController.%operationName%');


end.

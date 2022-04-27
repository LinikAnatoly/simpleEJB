unit RQFKOrderItem2FKOrderItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,RQFKOrder2FKOrderTypeController 
   ,RQFKOrderItemController 
   //,RQFKOrderItemController 
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

  RQFKOrderItem2FKOrderItem            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQFKOrderItem2FKOrderItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQFKOrderItem2FKOrderItem = class(TRemotable)
  private
    Fcode : Integer; 
    Fmodify_time : Int64;
//???
    FtypeRef : RQFKOrder2FKOrderTypeRef;
//???
    FfkOrderItemInRef : RQFKOrderItemRef;
//???
    FfkOrderItemOutRef : RQFKOrderItemRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property typeRef : RQFKOrder2FKOrderTypeRef read FtypeRef write FtypeRef; 
    property fkOrderItemInRef : RQFKOrderItemRef read FfkOrderItemInRef write FfkOrderItemInRef; 
    property fkOrderItemOutRef : RQFKOrderItemRef read FfkOrderItemOutRef write FfkOrderItemOutRef; 
  end;

  RQFKOrderItem2FKOrderItemFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fmodify_time : Int64;
//???
    FtypeRef : RQFKOrder2FKOrderTypeRef;
//???
    FfkOrderItemInRef : RQFKOrderItemRef;
//???
    FfkOrderItemOutRef : RQFKOrderItemRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property typeRef : RQFKOrder2FKOrderTypeRef read FtypeRef write FtypeRef; 
    property fkOrderItemInRef : RQFKOrderItemRef read FfkOrderItemInRef write FfkOrderItemInRef; 
    property fkOrderItemOutRef : RQFKOrderItemRef read FfkOrderItemOutRef write FfkOrderItemOutRef; 
  end;


  RQFKOrderItem2FKOrderItemShort = class(TRemotable)
  private
    Fcode : Integer; 
    FtypeRefCode : Integer; 
    FtypeRefName : WideString;
    FfkOrderItemInRefCode : Integer; 
    FfkOrderItemInRefFinCode : Integer; 
    FfkOrderItemInRefNomenclatureCode : Integer; 
    FfkOrderItemInRefNomenclatureNum : WideString;
    FfkOrderItemInRefNomenclatureBalSch : WideString;
    FfkOrderItemInRefNomenclatureName : WideString;
    FfkOrderItemInRefNomenclatureUnitCode : Integer; 
    FfkOrderItemInRefNomenclatureUnitName : WideString;
    FfkOrderItemInRefCountGen : TXSDecimal;
    FfkOrderItemInRefPrice : TXSDecimal;
    FfkOrderItemInRefSumGen : TXSDecimal;
    FfkOrderItemInRefUserGen : WideString;
    FfkOrderItemOutRefCode : Integer; 
    FfkOrderItemOutRefFinCode : Integer; 
    FfkOrderItemOutRefNomenclatureCode : Integer; 
    FfkOrderItemOutRefNomenclatureNum : WideString;
    FfkOrderItemOutRefNomenclatureBalSch : WideString;
    FfkOrderItemOutRefNomenclatureName : WideString;
    FfkOrderItemOutRefNomenclatureUnitCode : Integer; 
    FfkOrderItemOutRefNomenclatureUnitName : WideString;
    FfkOrderItemOutRefCountGen : TXSDecimal;
    FfkOrderItemOutRefPrice : TXSDecimal;
    FfkOrderItemOutRefSumGen : TXSDecimal;
    FfkOrderItemOutRefUserGen : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 

    property typeRefCode : Integer read FtypeRefCode write FtypeRefCode; 
    property typeRefName : WideString read FtypeRefName write FtypeRefName; 
    property fkOrderItemInRefCode : Integer read FfkOrderItemInRefCode write FfkOrderItemInRefCode; 
    property fkOrderItemInRefFinCode : Integer read FfkOrderItemInRefFinCode write FfkOrderItemInRefFinCode; 
    property fkOrderItemInRefNomenclatureCode : Integer read FfkOrderItemInRefNomenclatureCode write FfkOrderItemInRefNomenclatureCode; 
    property fkOrderItemInRefNomenclatureNum : WideString read FfkOrderItemInRefNomenclatureNum write FfkOrderItemInRefNomenclatureNum; 
    property fkOrderItemInRefNomenclatureBalSch : WideString read FfkOrderItemInRefNomenclatureBalSch write FfkOrderItemInRefNomenclatureBalSch; 
    property fkOrderItemInRefNomenclatureName : WideString read FfkOrderItemInRefNomenclatureName write FfkOrderItemInRefNomenclatureName; 
    property fkOrderItemInRefNomenclatureUnitCode : Integer read FfkOrderItemInRefNomenclatureUnitCode write FfkOrderItemInRefNomenclatureUnitCode; 
    property fkOrderItemInRefNomenclatureUnitName : WideString read FfkOrderItemInRefNomenclatureUnitName write FfkOrderItemInRefNomenclatureUnitName; 
    property fkOrderItemInRefCountGen : TXSDecimal read FfkOrderItemInRefCountGen write FfkOrderItemInRefCountGen; 
    property fkOrderItemInRefPrice : TXSDecimal read FfkOrderItemInRefPrice write FfkOrderItemInRefPrice; 
    property fkOrderItemInRefSumGen : TXSDecimal read FfkOrderItemInRefSumGen write FfkOrderItemInRefSumGen; 
    property fkOrderItemInRefUserGen : WideString read FfkOrderItemInRefUserGen write FfkOrderItemInRefUserGen; 
    property fkOrderItemOutRefCode : Integer read FfkOrderItemOutRefCode write FfkOrderItemOutRefCode; 
    property fkOrderItemOutRefFinCode : Integer read FfkOrderItemOutRefFinCode write FfkOrderItemOutRefFinCode; 
    property fkOrderItemOutRefNomenclatureCode : Integer read FfkOrderItemOutRefNomenclatureCode write FfkOrderItemOutRefNomenclatureCode; 
    property fkOrderItemOutRefNomenclatureNum : WideString read FfkOrderItemOutRefNomenclatureNum write FfkOrderItemOutRefNomenclatureNum; 
    property fkOrderItemOutRefNomenclatureBalSch : WideString read FfkOrderItemOutRefNomenclatureBalSch write FfkOrderItemOutRefNomenclatureBalSch; 
    property fkOrderItemOutRefNomenclatureName : WideString read FfkOrderItemOutRefNomenclatureName write FfkOrderItemOutRefNomenclatureName; 
    property fkOrderItemOutRefNomenclatureUnitCode : Integer read FfkOrderItemOutRefNomenclatureUnitCode write FfkOrderItemOutRefNomenclatureUnitCode; 
    property fkOrderItemOutRefNomenclatureUnitName : WideString read FfkOrderItemOutRefNomenclatureUnitName write FfkOrderItemOutRefNomenclatureUnitName; 
    property fkOrderItemOutRefCountGen : TXSDecimal read FfkOrderItemOutRefCountGen write FfkOrderItemOutRefCountGen; 
    property fkOrderItemOutRefPrice : TXSDecimal read FfkOrderItemOutRefPrice write FfkOrderItemOutRefPrice; 
    property fkOrderItemOutRefSumGen : TXSDecimal read FfkOrderItemOutRefSumGen write FfkOrderItemOutRefSumGen; 
    property fkOrderItemOutRefUserGen : WideString read FfkOrderItemOutRefUserGen write FfkOrderItemOutRefUserGen; 
  end;

  ArrayOfRQFKOrderItem2FKOrderItemShort = array of RQFKOrderItem2FKOrderItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQFKOrderItem2FKOrderItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQFKOrderItem2FKOrderItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQFKOrderItem2FKOrderItemShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQFKOrderItem2FKOrderItemController/message/
  // soapAction: http://ksoe.org/RQFKOrderItem2FKOrderItemController/action/RQFKOrderItem2FKOrderItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQFKOrderItem2FKOrderItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQFKOrderItem2FKOrderItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQFKOrderItem2FKOrderItemControllerSoapPort = interface(IInvokable)
  ['{16ff16ff-16ff-16ff-16ff-16ff16ff16ff}']
    function  add(const aRQFKOrderItem2FKOrderItem: RQFKOrderItem2FKOrderItem): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQFKOrderItem2FKOrderItem: RQFKOrderItem2FKOrderItem); stdcall;
    function  getObject(const anObjectCode: Integer): RQFKOrderItem2FKOrderItem; stdcall;
    function  getList: RQFKOrderItem2FKOrderItemShortList; stdcall;
    function  getFilteredList(const aRQFKOrderItem2FKOrderItemFilter: RQFKOrderItem2FKOrderItemFilter): RQFKOrderItem2FKOrderItemShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQFKOrderItem2FKOrderItemShortList; stdcall;
    function  getScrollableFilteredList(const aRQFKOrderItem2FKOrderItemFilter: RQFKOrderItem2FKOrderItemFilter; const aFromPosition: Integer; const aQuantity: Integer): RQFKOrderItem2FKOrderItemShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQFKOrderItem2FKOrderItemShortList; stdcall;
  end; 


implementation

  destructor RQFKOrderItem2FKOrderItem.Destroy;
  begin
    if Assigned(FtypeRef) then
      typeRef.Free;
    if Assigned(FfkOrderItemInRef) then
      fkOrderItemInRef.Free;
    if Assigned(FfkOrderItemOutRef) then
      fkOrderItemOutRef.Free;
    inherited Destroy;
  end;
  
  destructor RQFKOrderItem2FKOrderItemFilter.Destroy;
  begin
    if Assigned(FtypeRef) then
      typeRef.Free;
    if Assigned(FfkOrderItemInRef) then
      fkOrderItemInRef.Free;
    if Assigned(FfkOrderItemOutRef) then
      fkOrderItemOutRef.Free;
    inherited Destroy;
  end; 
  
  destructor RQFKOrderItem2FKOrderItemShort.Destroy;
  begin
    if Assigned(FfkOrderItemInRefCountGen) then
      fkOrderItemInRefCountGen.Free;
    if Assigned(FfkOrderItemInRefPrice) then
      fkOrderItemInRefPrice.Free;
    if Assigned(FfkOrderItemInRefSumGen) then
      fkOrderItemInRefSumGen.Free;
    if Assigned(FfkOrderItemOutRefCountGen) then
      fkOrderItemOutRefCountGen.Free;
    if Assigned(FfkOrderItemOutRefPrice) then
      fkOrderItemOutRefPrice.Free;
    if Assigned(FfkOrderItemOutRefSumGen) then
      fkOrderItemOutRefSumGen.Free;
    inherited Destroy;
  end; 
  
  destructor RQFKOrderItem2FKOrderItemShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQFKOrderItem2FKOrderItem, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderItem2FKOrderItem');
  RemClassRegistry.RegisterXSClass(RQFKOrderItem2FKOrderItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderItem2FKOrderItemRef');
  RemClassRegistry.RegisterXSClass(RQFKOrderItem2FKOrderItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderItem2FKOrderItemFilter');
  RemClassRegistry.RegisterXSClass(RQFKOrderItem2FKOrderItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderItem2FKOrderItemShort');
  RemClassRegistry.RegisterXSClass(RQFKOrderItem2FKOrderItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderItem2FKOrderItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQFKOrderItem2FKOrderItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQFKOrderItem2FKOrderItemShort');

  InvRegistry.RegisterInterface(TypeInfo(RQFKOrderItem2FKOrderItemControllerSoapPort), 'http://ksoe.org/RQFKOrderItem2FKOrderItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQFKOrderItem2FKOrderItemControllerSoapPort), 'http://ksoe.org/RQFKOrderItem2FKOrderItemController/action/RQFKOrderItem2FKOrderItemController.%operationName%');


end.

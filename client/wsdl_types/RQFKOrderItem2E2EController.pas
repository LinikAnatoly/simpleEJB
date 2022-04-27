unit RQFKOrderItem2E2EController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENEstimateItem2ENEstimateItemController 
   ,RQFKOrderItemController 
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

  RQFKOrderItem2E2E            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQFKOrderItem2E2ERef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQFKOrderItem2E2E = class(TRemotable)
  private
    Fcode : Integer; 
    FcountGen : TXSDecimal;
    Fmodify_time : Int64;
//???
    Fe2eRef : ENEstimateItem2ENEstimateItemRef;
//???
    FfkOrderItemRef : RQFKOrderItemRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property countGen : TXSDecimal read FcountGen write FcountGen; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property e2eRef : ENEstimateItem2ENEstimateItemRef read Fe2eRef write Fe2eRef; 
    property fkOrderItemRef : RQFKOrderItemRef read FfkOrderItemRef write FfkOrderItemRef; 
  end;
  
{
  RQFKOrderItem2E2EFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FcountGen : TXSDecimal;
    Fmodify_time : Int64;
//???
    Fe2eRef : ENEstimateItem2ENEstimateItemRef;
//???
    FfkOrderItemRef : RQFKOrderItemRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property countGen : TXSDecimal read FcountGen write FcountGen; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property e2eRef : ENEstimateItem2ENEstimateItemRef read Fe2eRef write Fe2eRef; 
    property fkOrderItemRef : RQFKOrderItemRef read FfkOrderItemRef write FfkOrderItemRef; 
  end;
}

  RQFKOrderItem2E2EFilter = class(RQFKOrderItem2E2E)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  RQFKOrderItem2E2EShort = class(TRemotable)
  private
    Fcode : Integer; 
    FcountGen : TXSDecimal;
    Fe2eRefCode : Integer; 
    Fe2eRefCountGen : TXSDecimal;
    FfkOrderItemRefCode : Integer; 
    FfkOrderItemRefFinCode : Integer; 
    FfkOrderItemRefNomenclatureCode : Integer; 
    FfkOrderItemRefNomenclatureNum : WideString;
    FfkOrderItemRefNomenclatureBalSch : WideString;
    FfkOrderItemRefNomenclatureName : WideString;
    FfkOrderItemRefNomenclatureUnitCode : Integer; 
    FfkOrderItemRefNomenclatureUnitName : WideString;
    FfkOrderItemRefContractNumber : WideString;
    FfkOrderItemRefContractDate : TXSDate;
    FfkOrderItemRefFinDocCode : WideString;
    FfkOrderItemRefFinDocID : Integer; 
    FfkOrderItemRefMaterialNameTxt : WideString;
    FfkOrderItemRefMeasurementNameTxt : WideString;
    FfkOrderItemRefCountGen : TXSDecimal;
    FfkOrderItemRefPriceWithoutNds : TXSDecimal;
    FfkOrderItemRefPriceWithNds : TXSDecimal;
    FfkOrderItemRefPriceNds : TXSDecimal;
    FfkOrderItemRefSumWithoutNds : TXSDecimal;
    FfkOrderItemRefSumNds : TXSDecimal;
    FfkOrderItemRefSumGen : TXSDecimal;
    FfkOrderItemRefUserGen : WideString;
    FfkOrderItemRefCommentGen : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property countGen : TXSDecimal read FcountGen write FcountGen; 

    property e2eRefCode : Integer read Fe2eRefCode write Fe2eRefCode; 
    property e2eRefCountGen : TXSDecimal read Fe2eRefCountGen write Fe2eRefCountGen; 
    property fkOrderItemRefCode : Integer read FfkOrderItemRefCode write FfkOrderItemRefCode; 
    property fkOrderItemRefFinCode : Integer read FfkOrderItemRefFinCode write FfkOrderItemRefFinCode; 
    property fkOrderItemRefNomenclatureCode : Integer read FfkOrderItemRefNomenclatureCode write FfkOrderItemRefNomenclatureCode; 
    property fkOrderItemRefNomenclatureNum : WideString read FfkOrderItemRefNomenclatureNum write FfkOrderItemRefNomenclatureNum; 
    property fkOrderItemRefNomenclatureBalSch : WideString read FfkOrderItemRefNomenclatureBalSch write FfkOrderItemRefNomenclatureBalSch; 
    property fkOrderItemRefNomenclatureName : WideString read FfkOrderItemRefNomenclatureName write FfkOrderItemRefNomenclatureName; 
    property fkOrderItemRefNomenclatureUnitCode : Integer read FfkOrderItemRefNomenclatureUnitCode write FfkOrderItemRefNomenclatureUnitCode; 
    property fkOrderItemRefNomenclatureUnitName : WideString read FfkOrderItemRefNomenclatureUnitName write FfkOrderItemRefNomenclatureUnitName; 
    property fkOrderItemRefContractNumber : WideString read FfkOrderItemRefContractNumber write FfkOrderItemRefContractNumber; 
    property fkOrderItemRefContractDate : TXSDate read FfkOrderItemRefContractDate write FfkOrderItemRefContractDate; 
    property fkOrderItemRefFinDocCode : WideString read FfkOrderItemRefFinDocCode write FfkOrderItemRefFinDocCode; 
    property fkOrderItemRefFinDocID : Integer read FfkOrderItemRefFinDocID write FfkOrderItemRefFinDocID; 
    property fkOrderItemRefMaterialNameTxt : WideString read FfkOrderItemRefMaterialNameTxt write FfkOrderItemRefMaterialNameTxt; 
    property fkOrderItemRefMeasurementNameTxt : WideString read FfkOrderItemRefMeasurementNameTxt write FfkOrderItemRefMeasurementNameTxt; 
    property fkOrderItemRefCountGen : TXSDecimal read FfkOrderItemRefCountGen write FfkOrderItemRefCountGen; 
    property fkOrderItemRefPriceWithoutNds : TXSDecimal read FfkOrderItemRefPriceWithoutNds write FfkOrderItemRefPriceWithoutNds; 
    property fkOrderItemRefPriceWithNds : TXSDecimal read FfkOrderItemRefPriceWithNds write FfkOrderItemRefPriceWithNds; 
    property fkOrderItemRefPriceNds : TXSDecimal read FfkOrderItemRefPriceNds write FfkOrderItemRefPriceNds; 
    property fkOrderItemRefSumWithoutNds : TXSDecimal read FfkOrderItemRefSumWithoutNds write FfkOrderItemRefSumWithoutNds; 
    property fkOrderItemRefSumNds : TXSDecimal read FfkOrderItemRefSumNds write FfkOrderItemRefSumNds; 
    property fkOrderItemRefSumGen : TXSDecimal read FfkOrderItemRefSumGen write FfkOrderItemRefSumGen; 
    property fkOrderItemRefUserGen : WideString read FfkOrderItemRefUserGen write FfkOrderItemRefUserGen; 
    property fkOrderItemRefCommentGen : WideString read FfkOrderItemRefCommentGen write FfkOrderItemRefCommentGen; 
  end;

  ArrayOfRQFKOrderItem2E2EShort = array of RQFKOrderItem2E2EShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQFKOrderItem2E2EShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQFKOrderItem2E2EShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQFKOrderItem2E2EShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQFKOrderItem2E2EController/message/
  // soapAction: http://ksoe.org/RQFKOrderItem2E2EController/action/RQFKOrderItem2E2EController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQFKOrderItem2E2EControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQFKOrderItem2E2EController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQFKOrderItem2E2EControllerSoapPort = interface(IInvokable)
  ['{53ad53ad-53ad-53ad-53ad-53ad53ad53ad}']
    function  add(const aRQFKOrderItem2E2E: RQFKOrderItem2E2E): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQFKOrderItem2E2E: RQFKOrderItem2E2E); stdcall;
    function  getObject(const anObjectCode: Integer): RQFKOrderItem2E2E; stdcall;
    function  getList: RQFKOrderItem2E2EShortList; stdcall;
    function  getFilteredList(const aRQFKOrderItem2E2EFilter: RQFKOrderItem2E2EFilter): RQFKOrderItem2E2EShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQFKOrderItem2E2EShortList; stdcall;
    function  getScrollableFilteredList(const aRQFKOrderItem2E2EFilter: RQFKOrderItem2E2EFilter; const aFromPosition: Integer; const aQuantity: Integer): RQFKOrderItem2E2EShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQFKOrderItem2E2EShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aRQFKOrderItem2E2EFilter: RQFKOrderItem2E2EFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor RQFKOrderItem2E2E.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(Fe2eRef) then
      e2eRef.Free;
    if Assigned(FfkOrderItemRef) then
      fkOrderItemRef.Free;
    inherited Destroy;
  end;

{  
  destructor RQFKOrderItem2E2EFilter.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(Fe2eRef) then
      e2eRef.Free;
    if Assigned(FfkOrderItemRef) then
      fkOrderItemRef.Free;
    inherited Destroy;
  end; 
}

  destructor RQFKOrderItem2E2EFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor RQFKOrderItem2E2EShort.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(Fe2eRefCountGen) then
      e2eRefCountGen.Free;
    if Assigned(FfkOrderItemRefContractDate) then
      fkOrderItemRefContractDate.Free;
    if Assigned(FfkOrderItemRefCountGen) then
      fkOrderItemRefCountGen.Free;
    if Assigned(FfkOrderItemRefPriceWithoutNds) then
      fkOrderItemRefPriceWithoutNds.Free;
    if Assigned(FfkOrderItemRefPriceWithNds) then
      fkOrderItemRefPriceWithNds.Free;
    if Assigned(FfkOrderItemRefPriceNds) then
      fkOrderItemRefPriceNds.Free;
    if Assigned(FfkOrderItemRefSumWithoutNds) then
      fkOrderItemRefSumWithoutNds.Free;
    if Assigned(FfkOrderItemRefSumNds) then
      fkOrderItemRefSumNds.Free;
    if Assigned(FfkOrderItemRefSumGen) then
      fkOrderItemRefSumGen.Free;
    inherited Destroy;
  end; 
  
  destructor RQFKOrderItem2E2EShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQFKOrderItem2E2E, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderItem2E2E');
  RemClassRegistry.RegisterXSClass(RQFKOrderItem2E2ERef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderItem2E2ERef');
  RemClassRegistry.RegisterXSClass(RQFKOrderItem2E2EFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderItem2E2EFilter');
  RemClassRegistry.RegisterXSClass(RQFKOrderItem2E2EShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderItem2E2EShort');
  RemClassRegistry.RegisterXSClass(RQFKOrderItem2E2EShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderItem2E2EShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQFKOrderItem2E2EShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQFKOrderItem2E2EShort');

  InvRegistry.RegisterInterface(TypeInfo(RQFKOrderItem2E2EControllerSoapPort), 'http://ksoe.org/RQFKOrderItem2E2EController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQFKOrderItem2E2EControllerSoapPort), 'http://ksoe.org/RQFKOrderItem2E2EController/action/RQFKOrderItem2E2EController.%operationName%');


end.

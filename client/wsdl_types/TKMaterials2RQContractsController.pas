unit TKMaterials2RQContractsController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,TKMaterialsController
   ,ENGeneralContractsController
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

  TKMaterials2RQContracts            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  TKMaterials2RQContractsRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  TKMaterials2RQContracts = class(TRemotable)
  private
    Fcode : Integer;
    Forg_id : Integer;
    Fcodeorg : WideString;
    Fname : WideString;
    FcontractNumber : WideString;
    FcontractDate : TXSDate;
    FfinDocCode : WideString;
    FfinDocID : Integer;
//???
    FmaterialRef : TKMaterialsRef;
//???
    FgeneralContractRef : ENGeneralContractsRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property  org_id : Integer read Forg_id write Forg_id;
    property codeorg : WideString read Fcodeorg write Fcodeorg;
    property name : WideString read Fname write Fname;
    property contractNumber : WideString read FcontractNumber write FcontractNumber;
    property contractDate : TXSDate read FcontractDate write FcontractDate;
    property finDocCode : WideString read FfinDocCode write FfinDocCode;
    property  finDocID : Integer read FfinDocID write FfinDocID;
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef;
    property generalContractRef : ENGeneralContractsRef read FgeneralContractRef write FgeneralContractRef;
  end;

{
  TKMaterials2RQContractsFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Forg_id : Integer;
    Fcodeorg : WideString;
    Fname : WideString;
    FcontractNumber : WideString;
    FcontractDate : TXSDate;
    FfinDocCode : WideString;
    FfinDocID : Integer;
//???
    FmaterialRef : TKMaterialsRef;
//???
    FgeneralContractRef : ENGeneralContractsRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property  org_id : Integer read Forg_id write Forg_id;
    property codeorg : WideString read Fcodeorg write Fcodeorg;
    property name : WideString read Fname write Fname;
    property contractNumber : WideString read FcontractNumber write FcontractNumber;
    property contractDate : TXSDate read FcontractDate write FcontractDate;
    property finDocCode : WideString read FfinDocCode write FfinDocCode;
    property  finDocID : Integer read FfinDocID write FfinDocID;
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef;
    property generalContractRef : ENGeneralContractsRef read FgeneralContractRef write FgeneralContractRef;
  end;
}

  TKMaterials2RQContractsFilter = class(TKMaterials2RQContracts)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  TKMaterials2RQContractsShort = class(TRemotable)
  private
    Fcode : Integer;
    Forg_id : Integer;
    Fcodeorg : WideString;
    Fname : WideString;
    FcontractNumber : WideString;
    FcontractDate : TXSDate;
    FfinDocCode : WideString;
    FfinDocID : Integer;
    FmaterialRefCode : Integer;
    FmaterialRefName : WideString;
    FmaterialRefCost : TXSDecimal;
    FmaterialRefDeliveryDate : Integer;
    FmaterialRefNumkatalog : WideString;
    FmaterialRefIdentid : WideString;
    FmaterialRefIdentid2010 : WideString;
    FmaterialRefCostnkre : TXSDecimal;
    FmaterialRefWeight : TXSDecimal;
    FmaterialRefCostAlternative : TXSDecimal;
    FmaterialRefIsMaterial : Integer;
    FmaterialRefIsBarcodeGenerated : Integer;
    FmaterialRefNomenclatureNumber : WideString;
    FmaterialRefNomenclatureAccount : WideString;
    FmaterialRefGost : WideString;
    FmaterialRefNameEtalon : WideString;
    FmaterialRefCost_tariff : TXSDecimal;
    FmaterialRefIdentid2015 : WideString;
    FmaterialRefUserGen : WideString;
    FmaterialRefDateEdit : TXSDateTime;
    FgeneralContractRefCode : Integer;
    FgeneralContractRefFinDocID : Integer;
    FgeneralContractRefFinDocCode : WideString;
    FgeneralContractRefContractNumber : WideString;
    FgeneralContractRefContractDate : TXSDate;
    FgeneralContractRefCommentGen : WideString;
    FgeneralContractRefPartnerId : Integer;
    FgeneralContractRefPartnerCode : WideString;
    FgeneralContractRefPartnerName : WideString;
    FgeneralContractRefContractRegDate : TXSDate;
    FgeneralContractRefContractStartDate : TXSDate;
    FgeneralContractRefContractEndDate : TXSDate;
    FgeneralContractRefAxContractId : WideString;
    FgeneralContractRefAxContractCode : WideString;
    FgeneralContractRefAxContractNumber : WideString;
    FgeneralContractRefAxContractAccount : WideString;
    FgeneralContractRefAxContractDate : TXSDate;
    FgeneralContractRefAxContractCommentGen : WideString;
    FgeneralContractRefAxContractGroupCode : WideString;
    FgeneralContractRefAxPartnerCode : WideString;
    FgeneralContractRefAxPartnerName : WideString;
    FgeneralContractRefUserGen : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property  org_id : Integer read Forg_id write Forg_id;
    property codeorg : WideString read Fcodeorg write Fcodeorg;
    property name : WideString read Fname write Fname;
    property contractNumber : WideString read FcontractNumber write FcontractNumber;
    property contractDate : TXSDate read FcontractDate write FcontractDate;
    property finDocCode : WideString read FfinDocCode write FfinDocCode;
    property  finDocID : Integer read FfinDocID write FfinDocID;

    property materialRefCode : Integer read FmaterialRefCode write FmaterialRefCode;
    property materialRefName : WideString read FmaterialRefName write FmaterialRefName;
    property materialRefCost : TXSDecimal read FmaterialRefCost write FmaterialRefCost;
    property materialRefDeliveryDate : Integer read FmaterialRefDeliveryDate write FmaterialRefDeliveryDate;
    property materialRefNumkatalog : WideString read FmaterialRefNumkatalog write FmaterialRefNumkatalog;
    property materialRefIdentid : WideString read FmaterialRefIdentid write FmaterialRefIdentid;
    property materialRefIdentid2010 : WideString read FmaterialRefIdentid2010 write FmaterialRefIdentid2010;
    property materialRefCostnkre : TXSDecimal read FmaterialRefCostnkre write FmaterialRefCostnkre;
    property materialRefWeight : TXSDecimal read FmaterialRefWeight write FmaterialRefWeight;
    property materialRefCostAlternative : TXSDecimal read FmaterialRefCostAlternative write FmaterialRefCostAlternative;
    property materialRefIsMaterial : Integer read FmaterialRefIsMaterial write FmaterialRefIsMaterial;
    property materialRefIsBarcodeGenerated : Integer read FmaterialRefIsBarcodeGenerated write FmaterialRefIsBarcodeGenerated;
    property materialRefNomenclatureNumber : WideString read FmaterialRefNomenclatureNumber write FmaterialRefNomenclatureNumber;
    property materialRefNomenclatureAccount : WideString read FmaterialRefNomenclatureAccount write FmaterialRefNomenclatureAccount;
    property materialRefGost : WideString read FmaterialRefGost write FmaterialRefGost;
    property materialRefNameEtalon : WideString read FmaterialRefNameEtalon write FmaterialRefNameEtalon;
    property materialRefCost_tariff : TXSDecimal read FmaterialRefCost_tariff write FmaterialRefCost_tariff;
    property materialRefIdentid2015 : WideString read FmaterialRefIdentid2015 write FmaterialRefIdentid2015;
    property materialRefUserGen : WideString read FmaterialRefUserGen write FmaterialRefUserGen;
    property materialRefDateEdit : TXSDateTime read FmaterialRefDateEdit write FmaterialRefDateEdit;
    property generalContractRefCode : Integer read FgeneralContractRefCode write FgeneralContractRefCode;
    property generalContractRefFinDocID : Integer read FgeneralContractRefFinDocID write FgeneralContractRefFinDocID;
    property generalContractRefFinDocCode : WideString read FgeneralContractRefFinDocCode write FgeneralContractRefFinDocCode;
    property generalContractRefContractNumber : WideString read FgeneralContractRefContractNumber write FgeneralContractRefContractNumber;
    property generalContractRefContractDate : TXSDate read FgeneralContractRefContractDate write FgeneralContractRefContractDate;
    property generalContractRefCommentGen : WideString read FgeneralContractRefCommentGen write FgeneralContractRefCommentGen;
    property generalContractRefPartnerId : Integer read FgeneralContractRefPartnerId write FgeneralContractRefPartnerId;
    property generalContractRefPartnerCode : WideString read FgeneralContractRefPartnerCode write FgeneralContractRefPartnerCode;
    property generalContractRefPartnerName : WideString read FgeneralContractRefPartnerName write FgeneralContractRefPartnerName;
    property generalContractRefContractRegDate : TXSDate read FgeneralContractRefContractRegDate write FgeneralContractRefContractRegDate;
    property generalContractRefContractStartDate : TXSDate read FgeneralContractRefContractStartDate write FgeneralContractRefContractStartDate;
    property generalContractRefContractEndDate : TXSDate read FgeneralContractRefContractEndDate write FgeneralContractRefContractEndDate;
    property generalContractRefAxContractId : WideString read FgeneralContractRefAxContractId write FgeneralContractRefAxContractId;
    property generalContractRefAxContractCode : WideString read FgeneralContractRefAxContractCode write FgeneralContractRefAxContractCode;
    property generalContractRefAxContractNumber : WideString read FgeneralContractRefAxContractNumber write FgeneralContractRefAxContractNumber;
    property generalContractRefAxContractAccount : WideString read FgeneralContractRefAxContractAccount write FgeneralContractRefAxContractAccount;
    property generalContractRefAxContractDate : TXSDate read FgeneralContractRefAxContractDate write FgeneralContractRefAxContractDate;
    property generalContractRefAxContractCommentGen : WideString read FgeneralContractRefAxContractCommentGen write FgeneralContractRefAxContractCommentGen;
    property generalContractRefAxContractGroupCode : WideString read FgeneralContractRefAxContractGroupCode write FgeneralContractRefAxContractGroupCode;
    property generalContractRefAxPartnerCode : WideString read FgeneralContractRefAxPartnerCode write FgeneralContractRefAxPartnerCode;
    property generalContractRefAxPartnerName : WideString read FgeneralContractRefAxPartnerName write FgeneralContractRefAxPartnerName;
    property generalContractRefUserGen : WideString read FgeneralContractRefUserGen write FgeneralContractRefUserGen;
  end;

  ArrayOfTKMaterials2RQContractsShort = array of TKMaterials2RQContractsShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  TKMaterials2RQContractsShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfTKMaterials2RQContractsShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfTKMaterials2RQContractsShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/TKMaterials2RQContractsController/message/
  // soapAction: http://ksoe.org/TKMaterials2RQContractsController/action/TKMaterials2RQContractsController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : TKMaterials2RQContractsControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : TKMaterials2RQContractsController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  TKMaterials2RQContractsControllerSoapPort = interface(IInvokable)
  ['{46749C5D-32D1-4697-B25A-A4E40008A8C9}']
    function add(const aTKMaterials2RQContracts: TKMaterials2RQContracts): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aTKMaterials2RQContracts: TKMaterials2RQContracts); stdcall;
    function getObject(const anObjectCode: Integer): TKMaterials2RQContracts; stdcall;
    function getList: TKMaterials2RQContractsShortList; stdcall;
    function getFilteredList(const aTKMaterials2RQContractsFilter: TKMaterials2RQContractsFilter): TKMaterials2RQContractsShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): TKMaterials2RQContractsShortList; stdcall;
    function getScrollableFilteredList(const aTKMaterials2RQContractsFilter: TKMaterials2RQContractsFilter; const aFromPosition: Integer; const aQuantity: Integer): TKMaterials2RQContractsShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): TKMaterials2RQContractsShortList; stdcall;
    function getScrollableFilteredCodeArray(const aTKMaterials2RQContractsFilter: TKMaterials2RQContractsFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): TKMaterials2RQContractsShort; stdcall;
  end;


implementation

  destructor TKMaterials2RQContracts.Destroy;
  begin
    if Assigned(FcontractDate) then
      contractDate.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(FgeneralContractRef) then
      generalContractRef.Free;
    inherited Destroy;
  end;

{
  destructor TKMaterials2RQContractsFilter.Destroy;
  begin
    if Assigned(FcontractDate) then
      contractDate.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(FgeneralContractRef) then
      generalContractRef.Free;
    inherited Destroy;
  end;
}

  destructor TKMaterials2RQContractsFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor TKMaterials2RQContractsShort.Destroy;
  begin
    if Assigned(FcontractDate) then
      contractDate.Free;
    if Assigned(FmaterialRefCost) then
      materialRefCost.Free;
    if Assigned(FmaterialRefCostnkre) then
      materialRefCostnkre.Free;
    if Assigned(FmaterialRefWeight) then
      materialRefWeight.Free;
    if Assigned(FmaterialRefCostAlternative) then
      materialRefCostAlternative.Free;
    if Assigned(FmaterialRefCost_tariff) then
      materialRefCost_tariff.Free;
    if Assigned(FmaterialRefDateEdit) then
      materialRefDateEdit.Free;
    if Assigned(FgeneralContractRefContractDate) then
      generalContractRefContractDate.Free;
    if Assigned(FgeneralContractRefContractRegDate) then
      generalContractRefContractRegDate.Free;
    if Assigned(FgeneralContractRefContractStartDate) then
      generalContractRefContractStartDate.Free;
    if Assigned(FgeneralContractRefContractEndDate) then
      generalContractRefContractEndDate.Free;
    if Assigned(FgeneralContractRefAxContractDate) then
      generalContractRefAxContractDate.Free;
    inherited Destroy;
  end;

  destructor TKMaterials2RQContractsShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(TKMaterials2RQContracts, 'http://ksoe.org/EnergyproControllerService/type/', 'TKMaterials2RQContracts');
  RemClassRegistry.RegisterXSClass(TKMaterials2RQContractsRef, 'http://ksoe.org/EnergyproControllerService/type/', 'TKMaterials2RQContractsRef');
  RemClassRegistry.RegisterXSClass(TKMaterials2RQContractsFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'TKMaterials2RQContractsFilter');
  RemClassRegistry.RegisterXSClass(TKMaterials2RQContractsShort, 'http://ksoe.org/EnergyproControllerService/type/', 'TKMaterials2RQContractsShort');
  RemClassRegistry.RegisterXSClass(TKMaterials2RQContractsShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'TKMaterials2RQContractsShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfTKMaterials2RQContractsShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfTKMaterials2RQContractsShort');

  InvRegistry.RegisterInterface(TypeInfo(TKMaterials2RQContractsControllerSoapPort), 'http://ksoe.org/TKMaterials2RQContractsController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(TKMaterials2RQContractsControllerSoapPort), 'http://ksoe.org/TKMaterials2RQContractsController/action/TKMaterials2RQContractsController.%operationName%');


end.

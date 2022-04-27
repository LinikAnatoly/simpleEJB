unit ENNecessityBuildingController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns
    , EnergyProController, EnergyProController2
    , ENElementTypeController
    , ENServicesObjectController
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

  ENNecessityBuilding            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENNecessityBuildingRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENNecessityBuilding = class(TRemotable)
  private
    Fcode : Integer;
    FcountGen : TXSDecimal;
    FsummaGen : TXSDecimal;
    Fdescription : WideString;
    FdateEdit : TXSDateTime;
    FuserGen : WideString;
//???
    FelementTypeRef : ENElementTypeRef;
//???
    FvoltageNominal : EPVoltageNominal;
//???
    FservicesObjectRef : ENServicesObjectRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property summaGen : TXSDecimal read FsummaGen write FsummaGen;
    property description : WideString read Fdescription write Fdescription;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property userGen : WideString read FuserGen write FuserGen;
    property elementTypeRef : ENElementTypeRef read FelementTypeRef write FelementTypeRef;
    property voltageNominal : EPVoltageNominal read FvoltageNominal write FvoltageNominal;
    property servicesObjectRef : ENServicesObjectRef read FservicesObjectRef write FservicesObjectRef;
  end;

{
  ENNecessityBuildingFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FcountGen : TXSDecimal;
    FsummaGen : TXSDecimal;
    Fdescription : WideString;
    FdateEdit : DateTime;
    FuserGen : WideString;
//???
    FelementTypeRef : ENElementTypeRef;
//???
    FvoltageNominal : EPVoltageNominal;
//???
    FservicesObjectRef : ENServicesObjectRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property summaGen : TXSDecimal read FsummaGen write FsummaGen;
    property description : WideString read Fdescription write Fdescription;
    property dateEdit : DateTime;
    property userGen : WideString read FuserGen write FuserGen;
    property elementTypeRef : ENElementTypeRef read FelementTypeRef write FelementTypeRef;
    property voltageNominal : EPVoltageNominal read FvoltageNominal write FvoltageNominal;
    property servicesObjectRef : ENServicesObjectRef read FservicesObjectRef write FservicesObjectRef;
  end;
}

  ENNecessityBuildingFilter = class(ENNecessityBuilding)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENNecessityBuildingShort = class(TRemotable)
  private
    Fcode : Integer;
    FcountGen : TXSDecimal;
    FsummaGen : TXSDecimal;
    Fdescription : WideString;
    FdateEdit : TXSDateTime;
    FuserGen : WideString;
    FelementTypeRefCode : Integer;
    FelementTypeRefName : WideString;
    FvoltageNominalCode : Integer;
    FvoltageNominalValue : WideString;
    FservicesObjectRefCode : Integer;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property summaGen : TXSDecimal read FsummaGen write FsummaGen;
    property description : WideString read Fdescription write Fdescription;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property userGen : WideString read FuserGen write FuserGen;

    property elementTypeRefCode : Integer read FelementTypeRefCode write FelementTypeRefCode;
    property elementTypeRefName : WideString read FelementTypeRefName write FelementTypeRefName;
    property voltageNominalCode : Integer read FvoltageNominalCode write FvoltageNominalCode;
    property voltageNominalValue : WideString read FvoltageNominalValue write FvoltageNominalValue;
    property servicesObjectRefCode : Integer read FservicesObjectRefCode write FservicesObjectRefCode;
  end;

  ArrayOfENNecessityBuildingShort = array of ENNecessityBuildingShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENNecessityBuildingShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENNecessityBuildingShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENNecessityBuildingShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENNecessityBuildingController/message/
  // soapAction: http://ksoe.org/ENNecessityBuildingController/action/ENNecessityBuildingController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENNecessityBuildingControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENNecessityBuildingController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENNecessityBuildingControllerSoapPort = interface(IInvokable)
  ['{CF3D4F5A-5B4C-41AC-8CA9-03E3275BDFFC}']
    function add(const aENNecessityBuilding: ENNecessityBuilding): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENNecessityBuilding: ENNecessityBuilding); stdcall;
    function getObject(const anObjectCode: Integer): ENNecessityBuilding; stdcall;
    function getList: ENNecessityBuildingShortList; stdcall;
    function getFilteredList(const aENNecessityBuildingFilter: ENNecessityBuildingFilter): ENNecessityBuildingShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENNecessityBuildingShortList; stdcall;
    function getScrollableFilteredList(const aENNecessityBuildingFilter: ENNecessityBuildingFilter; const aFromPosition: Integer; const aQuantity: Integer): ENNecessityBuildingShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENNecessityBuildingShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENNecessityBuildingFilter: ENNecessityBuildingFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENNecessityBuildingShort; stdcall;
  end;


implementation

  destructor ENNecessityBuilding.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FsummaGen) then
      summaGen.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FelementTypeRef) then
      elementTypeRef.Free;
    if Assigned(FvoltageNominal) then
      voltageNominal.Free;
    if Assigned(FservicesObjectRef) then
      servicesObjectRef.Free;
    inherited Destroy;
  end;

{
  destructor ENNecessityBuildingFilter.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FsummaGen) then
      summaGen.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FelementTypeRef) then
      elementTypeRef.Free;
    if Assigned(FvoltageNominal) then
      voltageNominal.Free;
    if Assigned(FservicesObjectRef) then
      servicesObjectRef.Free;
    inherited Destroy;
  end;
}

  destructor ENNecessityBuildingFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENNecessityBuildingShort.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FsummaGen) then
      summaGen.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    inherited Destroy;
  end;

  destructor ENNecessityBuildingShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENNecessityBuilding, 'http://ksoe.org/EnergyproControllerService/type/', 'ENNecessityBuilding');
  RemClassRegistry.RegisterXSClass(ENNecessityBuildingRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENNecessityBuildingRef');
  RemClassRegistry.RegisterXSClass(ENNecessityBuildingFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENNecessityBuildingFilter');
  RemClassRegistry.RegisterXSClass(ENNecessityBuildingShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENNecessityBuildingShort');
  RemClassRegistry.RegisterXSClass(ENNecessityBuildingShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENNecessityBuildingShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENNecessityBuildingShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENNecessityBuildingShort');

  InvRegistry.RegisterInterface(TypeInfo(ENNecessityBuildingControllerSoapPort), 'http://ksoe.org/ENNecessityBuildingController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENNecessityBuildingControllerSoapPort), 'http://ksoe.org/ENNecessityBuildingController/action/ENNecessityBuildingController.%operationName%');


end.

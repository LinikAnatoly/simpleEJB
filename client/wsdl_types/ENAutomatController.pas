unit ENAutomatController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENAutomatTypeController 
   ,TKMaterialsController 
   ,ENElementController 
   ,ENBranchController 
   ,ENLowVoltBoardController 
   ,ENPanelController 
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

  ENAutomat            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENAutomatRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENAutomat = class(TRemotable)
  private
    Fname : WideString;
    Fcode : Integer; 
    FmarkCurrent : TXSDecimal;
    FthermalSplitterCurrent : TXSDecimal;
    Fmodify_time : Int64;
//???
    FautomatType : ENAutomatType;
//???
    FmaterialRef : TKMaterialsRef;
//???
    Felement : ENElement;
//???
    Fbranch : ENBranchRef;
//???
    FlvbRef : ENLowVoltBoardRef;
//???
    Fpanel : ENPanelRef;
  public
    destructor Destroy; override;
  published
    property name : WideString read Fname write Fname;
    property  code : Integer read Fcode write Fcode; 
    property markCurrent : TXSDecimal read FmarkCurrent write FmarkCurrent;
    property thermalSplitterCurrent : TXSDecimal read FthermalSplitterCurrent write FthermalSplitterCurrent;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property automatType : ENAutomatType read FautomatType write FautomatType; 
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef; 
    property element : ENElement read Felement write Felement; 
    property branch : ENBranchRef read Fbranch write Fbranch; 
    property lvbRef : ENLowVoltBoardRef read FlvbRef write FlvbRef; 
    property panel : ENPanelRef read Fpanel write Fpanel; 
  end;
  
{
  ENAutomatFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fname : WideString;
    Fcode : Integer; 
    FmarkCurrent : TXSDecimal;
    FthermalSplitterCurrent : TXSDecimal;
    Fmodify_time : Int64;
//???
    FautomatType : ENAutomatType;
//???
    FmaterialRef : TKMaterialsRef;
//???
    Felement : ENElement;
//???
    Fbranch : ENBranchRef;
//???
    FlvbRef : ENLowVoltBoardRef;
//???
    Fpanel : ENPanelRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property name : WideString read Fname write Fname;
    property  code : Integer read Fcode write Fcode; 
    property markCurrent : TXSDecimal read FmarkCurrent write FmarkCurrent; 
    property thermalSplitterCurrent : TXSDecimal read FthermalSplitterCurrent write FthermalSplitterCurrent; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property automatType : ENAutomatType read FautomatType write FautomatType; 
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef; 
    property element : ENElement read Felement write Felement; 
    property branch : ENBranchRef read Fbranch write Fbranch; 
    property lvbRef : ENLowVoltBoardRef read FlvbRef write FlvbRef; 
    property panel : ENPanelRef read Fpanel write Fpanel; 
  end;
}

  ENAutomatFilter = class(ENAutomat)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENAutomatShort = class(TRemotable)
  private
    Fname: WideString;
    Fcode: Integer;
    FautomatTypeCode: Integer;
    FautomatTypeName: WideString;
    FmaterialRefCode: Integer;
    FmaterialRefName: WideString;
    FmaterialRefCost : TXSDecimal;
    FmaterialRefDeliveryDate : Integer; 
    FmaterialRefNumkatalog : WideString;
    FmaterialRefIdentid : WideString;
    FelementCode: Integer;
    FbranchCode: Integer;
    FbranchName: WideString;
    FbranchBasicConsumer: WideString;
    FbranchNumberGen: WideString;
    FbranchCurrentAdmis : TXSDecimal;
    FpanelCode : Integer;
    FpanelName: WideString;
    FmarkCurrent : TXSDecimal;
    FthermalSplitterCurrent : TXSDecimal;
    FlvbRefCode : Integer; 
    FlvbRefName : WideString;
    FtransformerCode: Integer;
    FtransformerInvNumber: WideString;
    FtransformerName: WideString;
    FtransformerNominalPower: TXSDecimal;
    FrenName:WideString;
  public
    destructor Destroy; override;
  published
    property name: WideString read Fname write Fname;
    property code: Integer read Fcode write Fcode;
    property automatTypeCode: Integer read FautomatTypeCode write FautomatTypeCode;
    property automatTypeName: WideString read FautomatTypeName write FautomatTypeName;
    property materialRefCode: Integer read FmaterialRefCode write FmaterialRefCode; //TKMaterialsRef read FmaterialRefCode write FmaterialRefCode;
    property materialRefName: WideString read FmaterialRefName write FmaterialRefName;
    property materialRefCost : TXSDecimal read FmaterialRefCost write FmaterialRefCost; 
    property materialRefDeliveryDate : Integer read FmaterialRefDeliveryDate write FmaterialRefDeliveryDate; 
    property materialRefNumkatalog : WideString read FmaterialRefNumkatalog write FmaterialRefNumkatalog; 
    property materialRefIdentid : WideString read FmaterialRefIdentid write FmaterialRefIdentid; 
    property markCurrent : TXSDecimal read FmarkCurrent write FmarkCurrent;
    property thermalSplitterCurrent : TXSDecimal read FthermalSplitterCurrent write FthermalSplitterCurrent;
    property elementCode: Integer read FelementCode write FelementCode; //ENElementRef read FelementCode write FelementCode;
    property branchCode: Integer read FbranchCode write FbranchCode;
    property branchName: WideString read FbranchName write FbranchName;
    property branchBasicConsumer: WideString read FbranchBasicConsumer write FbranchBasicConsumer;
    property branchNumberGen: WideString read FbranchNumberGen write FbranchNumberGen;
    property branchCurrentAdmis : TXSDecimal read FbranchCurrentAdmis write FbranchCurrentAdmis; 
    property panelCode : Integer read FpanelCode write FpanelCode;
    property panelName: WideString read FpanelName write FpanelName;
    property lvbRefCode : Integer read FlvbRefCode write FlvbRefCode;
    property lvbRefName : WideString read FlvbRefName write FlvbRefName;
    property transformerCode: Integer read FtransformerCode write FtransformerCode;
    property transformerInvNumber: WideString read FtransformerInvNumber write FtransformerInvNumber;
    property transformerName: WideString read FtransformerName write FtransformerName;
    property transformerNominalPower: TXSDecimal read FtransformerNominalPower write FtransformerNominalPower;
    property renName: WideString read FrenName write FrenName;
  end;

  ArrayOfENAutomatShort = array of ENAutomatShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENAutomatShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENAutomatShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENAutomatShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENAutomatController/message/
  // soapAction: http://ksoe.org/ENAutomatController/action/ENAutomatController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENAutomatControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENAutomatController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENAutomatControllerSoapPort = interface(IInvokable)
  ['{152C7FF2-2A5A-4E8C-AE72-24FE0A991E55}']
    function  add(const aENAutomat: ENAutomat): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENAutomat: ENAutomat); stdcall;
    function  getObject(const anObjectCode: Integer): ENAutomat; stdcall;
    function  getList: ENAutomatShortList; stdcall;
    function  getFilteredList(const aENAutomatFilter: ENAutomatFilter): ENAutomatShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENAutomatShortList; stdcall;
    function  getScrollableFilteredList(const aENAutomatFilter: ENAutomatFilter; const aFromPosition: Integer; const aQuantity: Integer): ENAutomatShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENAutomatShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENAutomatFilter: ENAutomatFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENAutomat.Destroy;
  begin
    if Assigned(FmarkCurrent) then
      markCurrent.Free;
    if Assigned(FthermalSplitterCurrent) then
      thermalSplitterCurrent.Free;
    if Assigned(FautomatType) then
      automatType.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(Fbranch) then
      branch.Free;
    if Assigned(FlvbRef) then
      lvbRef.Free;
    if Assigned(Fpanel) then
      panel.Free;
    inherited Destroy;
  end;

{  
  destructor ENAutomatFilter.Destroy;
  begin
    if Assigned(FmarkCurrent) then
      markCurrent.Free;
    if Assigned(FthermalSplitterCurrent) then
      thermalSplitterCurrent.Free;
    if Assigned(FautomatType) then
      automatType.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(Fbranch) then
      branch.Free;
    if Assigned(FlvbRef) then
      lvbRef.Free;
    if Assigned(Fpanel) then
      panel.Free;
    inherited Destroy;
  end; 
}

  destructor ENAutomatFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENAutomatShort.Destroy;
  begin
    if Assigned(FmaterialRefCost) then
      materialRefCost.Free;
    if Assigned(FbranchCurrentAdmis) then
      branchCurrentAdmis.Free;
    inherited Destroy;
  end; 
  
  destructor ENAutomatShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENAutomat, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAutomat');
  RemClassRegistry.RegisterXSClass(ENAutomatRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAutomatRef');
  RemClassRegistry.RegisterXSClass(ENAutomatFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAutomatFilter');
  RemClassRegistry.RegisterXSClass(ENAutomatShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAutomatShort');
  RemClassRegistry.RegisterXSClass(ENAutomatShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAutomatShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENAutomatShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENAutomatShort');

  InvRegistry.RegisterInterface(TypeInfo(ENAutomatControllerSoapPort), 'http://ksoe.org/ENAutomatController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENAutomatControllerSoapPort), 'http://ksoe.org/ENAutomatController/action/ENAutomatController.%operationName%');


end.
